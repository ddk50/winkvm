/*
 * QEMU migration support
 * 
 * Copyright (C) 2007 Anthony Liguori <anthony@codemonkey.ws>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "vl.h"
#include "qemu_socket.h"
#ifdef USE_KVM
#include "qemu-kvm.h"
#endif

#include <sys/wait.h>

#define MIN_FINALIZE_SIZE	(200 << 10)
#define MAX_ITERATIONS           30
#define MAX_RAPID_WRITES          2

typedef struct MigrationState
{
    int fd;
    int throttle_count;
    int bps;
    int updated_pages;
    int last_updated_pages;
    int iteration;
    int n_buffer; /* number of bytes in @buffer already sent */
    int l_buffer; /* number of bytes in @buffer to send */
    int throttled;
    int *has_error;
    char buffer[TARGET_PAGE_SIZE + 4 + 4];
    target_ulong addr;
    QEMUTimer *timer;
    void *opaque;
    int detach;
    int (*release)(void *opaque);
    int rapid_writes;
} MigrationState;

static uint32_t max_throttle = (32 << 20);
static MigrationState *current_migration;
static int wait_for_message_timeout = 3000; /* 3 seconds */
static int status; /* last migration status */

enum { /* migration status values */
    MIG_STAT_SUCCESS           = 0,
    
    /* src error codes */
    MIG_STAT_INVALID_PARAMS    = 1,
    MIG_STAT_INVALID_ADDR      = 2,
    MIG_STAT_SOCKET_FAILED     = 3,
    MIG_STAT_SOCKOPT_FAILED    = 4,
    MIG_STAT_BIND_FAILED       = 5,
    MIG_STAT_LISTEN_FAILED     = 6,
    MIG_STAT_ACCEPT_FAILED     = 7,
    MIG_STAT_CONNECT_FAILED    = 8,
    MIG_STAT_WRITE_FAILED      = 9,
    MIG_STAT_READ_FAILED       = 10,
    MIG_STAT_CONNECTION_CLOSED = 11,
    MIG_STAT_SELECT_FAILED     = 12,
    MIG_STAT_SELECT_TIMEOUT    = 13,
    MIG_STAT_SELECT_FD_NOT_SET = 14,

    MIG_STAT_SAVEVM_FAILED     = 15,
    MIG_STAT_NO_MEM            = 16,

    MIG_STAT_MIGRATION_CANCEL  = 20,

    /* kvm error codes (on src) */
    MIG_STAT_KVM_UPDATE_DIRTY_PAGES_LOG_FAILED  = 101,
    MIG_STAT_KVM_SET_DIRTY_TRACKING_FAILED      = 102,
    MIG_STAT_KVM_GET_PAGE_BITMAP                = 103,

    /* dst error codes */
    MIG_STAT_DST_INVALID_PARAMS    = 200 + MIG_STAT_INVALID_PARAMS,
    MIG_STAT_DST_INVALID_ADDR      = 200 + MIG_STAT_INVALID_ADDR,
    MIG_STAT_DST_SOCKET_FAILED     = 200 + MIG_STAT_SOCKET_FAILED,
    MIG_STAT_DST_SOCKOPT_FAILED    = 200 + MIG_STAT_SOCKOPT_FAILED,
    MIG_STAT_DST_BIND_FAILED       = 200 + MIG_STAT_BIND_FAILED,
    MIG_STAT_DST_LISTEN_FAILED     = 200 + MIG_STAT_LISTEN_FAILED,
    MIG_STAT_DST_ACCEPT_FAILED     = 200 + MIG_STAT_ACCEPT_FAILED,
    MIG_STAT_DST_CONNECT_FAILED    = 200 + MIG_STAT_CONNECT_FAILED,
    MIG_STAT_DST_WRITE_FAILED      = 200 + MIG_STAT_WRITE_FAILED,
    MIG_STAT_DST_READ_FAILED       = 200 + MIG_STAT_READ_FAILED,

    MIG_STAT_DST_CONNECTION_CLOSED = 200 + MIG_STAT_CONNECTION_CLOSED,
    MIG_STAT_DST_SELECT_FAILED     = 200 + MIG_STAT_SELECT_FAILED,
    MIG_STAT_DST_SELECT_TIMEOUT    = 200 + MIG_STAT_SELECT_TIMEOUT,
    MIG_STAT_DST_SELECT_FD_NOT_SET = 200 + MIG_STAT_SELECT_FD_NOT_SET,

    MIG_STAT_DST_LOADVM_FAILED     = 200 + MIG_STAT_SAVEVM_FAILED,
    MIG_STAT_DST_NO_MEM            = 200 + MIG_STAT_NO_MEM,

    MIG_STAT_DST_GET_PAGE_FAILED       = 230,
    MIG_STAT_DST_GET_PAGE_UNKNOWN_TYPE = 231,
    MIG_STAT_DST_MEM_SIZE_MISMATCH     = 232,
};

//#define MIGRATION_VERIFY
#ifdef MIGRATION_VERIFY
static int save_verify_memory(QEMUFile *f, void *opaque);
static int load_verify_memory(QEMUFile *f, void *opaque, int version_id);
#endif /* MIGRATION_VERIFY */

/* QEMUFile migration implementation */

static void migrate_put_buffer(void *opaque, const uint8_t *buf, int64_t pos, int size)
{
    MigrationState *s = opaque;
    int offset = 0;

    if (*s->has_error)
	return;

    while (offset < size) {
	ssize_t len;

	len = write(s->fd, buf + offset, size - offset);
	if (len == -1) {
	    if (errno == EAGAIN || errno == EINTR)
		continue;
            term_printf("migration: write failed (%s)\n", strerror(errno));
	    *s->has_error = MIG_STAT_WRITE_FAILED;
	    break;
	} else if (len == 0) {
            term_printf("migration: other side closed connection\n");
	    *s->has_error = MIG_STAT_CONNECTION_CLOSED;
	    break;
	}

	offset += len;
    }
}

static void migrate_close(void *opaque)
{
    MigrationState *s = opaque;

    if (s->release)
	s->release(s->opaque);

    qemu_free(s);
    current_migration = NULL;
}

/* Outgoing migration routines */
static void migrate_finish(MigrationState *s)
{
    QEMUFile *f;
    int ret = 0;
    int *has_error = s->has_error;

    fcntl(s->fd, F_SETFL, 0);

    if (! *has_error) {
        f = qemu_fopen(s, migrate_put_buffer, NULL, migrate_close);
        qemu_aio_flush();
        vm_stop(0);
        qemu_put_be32(f, 1);
        ret = qemu_live_savevm_state(f);
#ifdef MIGRATION_VERIFY
        save_verify_memory(f, NULL);
#endif /* MIGRATION_VERIFY */
        qemu_fclose(f);
    }
    status = *has_error;
    if (ret && !status)
        status = MIG_STAT_SAVEVM_FAILED;
    if (status) {
	term_printf("Migration failed! ret=%d error=%d\n", ret, *has_error);
	vm_start();
    }
    if (!s->detach)
	monitor_resume();
    qemu_free(has_error);
    cpu_physical_memory_set_dirty_tracking(0);
}

static int migrate_write_buffer(MigrationState *s)
{
    if (*s->has_error)
	return 0;

    if (s->n_buffer < s->l_buffer) {
	ssize_t len;
    again:
	len = write(s->fd, s->buffer + s->n_buffer, s->l_buffer - s->n_buffer);
	if (len == -1) {
	    if (errno == EINTR)
		goto again;
	    if (errno == EAGAIN)
		return 1;
	    *s->has_error = MIG_STAT_WRITE_FAILED;
	    return 0;
	}
	if (len == 0) {
	    *s->has_error = MIG_STAT_CONNECTION_CLOSED;
	    return 0;
	}

	s->throttle_count += len;
	s->n_buffer += len;
	if (s->n_buffer < s->l_buffer)
	    goto again;
    }

    if (s->throttle_count > max_throttle) {
	s->throttled = 1;
	qemu_set_fd_handler2(s->fd, NULL, NULL, NULL, NULL);
	return 1;
    }

    return 0;
}

static int migrate_check_convergence(MigrationState *s)
{
    target_ulong addr;
    int dirty_count = 0;

    if ((s->iteration >= MAX_ITERATIONS) ||
        (s->rapid_writes >= MAX_RAPID_WRITES) ) {
        return 1;
    }

    for (addr = 0; addr < phys_ram_size; addr += TARGET_PAGE_SIZE) {
#ifdef USE_KVM
        if (kvm_allowed && (addr>=0xa0000) && (addr<0xc0000)) /* do not access video-addresses */
            continue;
#endif
	if (cpu_physical_memory_get_dirty(addr, MIGRATION_DIRTY_FLAG))
	    dirty_count++;
    }

    return ((dirty_count * TARGET_PAGE_SIZE) < MIN_FINALIZE_SIZE);
}

static int ram_page_is_homogeneous(uint32_t addr)
{
    int i, n;
    uint32_t *p, v;
    
    n = TARGET_PAGE_SIZE / sizeof(v);
    p = (uint32 *)(phys_ram_base + addr);

    v = p[0];
    for (i=1; i<n; i++)
        if (p[i] != v)
            return 0;
    return 1;
}

static void migrate_prepare_page(MigrationState *s)
{
    uint32_t value;
    char type;
    const char *buff;
    int bufflen;
    
    value = cpu_to_be32(s->addr);
    memcpy(s->buffer, &value, 4);
    
    if (ram_page_is_homogeneous(s->addr)) {
        type = 1; /* keeping ram_get_page() values */
        bufflen = 4;
        value = cpu_to_be32(s->addr);
        buff = (const char *)&value;
    }
    else {
        type = 0;
        bufflen = TARGET_PAGE_SIZE;
        buff = phys_ram_base + s->addr;
    }
    
    s->buffer[4] = type;
    memcpy(s->buffer + 4 + 1, phys_ram_base + s->addr, bufflen);
    s->n_buffer = 0;
    s->l_buffer = 4 + 1 + bufflen;
}

static void migrate_write(void *opaque)
{
    MigrationState *s = opaque;

    if (migrate_write_buffer(s))
	return;

#ifdef USE_KVM
    if (kvm_allowed && !*s->has_error && kvm_update_dirty_pages_log())
        *s->has_error = MIG_STAT_KVM_UPDATE_DIRTY_PAGES_LOG_FAILED;
#endif

    if (migrate_check_convergence(s) || *s->has_error) {
	qemu_del_timer(s->timer);
	qemu_free_timer(s->timer);
	qemu_set_fd_handler2(s->fd, NULL, NULL, NULL, NULL);
	migrate_finish(s);
	return;
    }	

    while (s->addr < phys_ram_size) {
#ifdef USE_KVM
        if (kvm_allowed && (s->addr>=0xa0000) && (s->addr<0xc0000)) /* do not access video-addresses */
            s->addr = 0xc0000;
#endif

	if (cpu_physical_memory_get_dirty(s->addr, MIGRATION_DIRTY_FLAG)) {
            migrate_prepare_page(s);
	    cpu_physical_memory_reset_dirty(s->addr, s->addr + TARGET_PAGE_SIZE, MIGRATION_DIRTY_FLAG);

	    s->addr += TARGET_PAGE_SIZE;

	    s->updated_pages++;

	    if (migrate_write_buffer(s))
		return;
	} else
	    s->addr += TARGET_PAGE_SIZE;
    }

    if ((s->iteration) && (s->last_updated_pages <= s->updated_pages)) {
        s->rapid_writes++; /* "dirt-speed" is faster than transfer speed */
    }
    s->last_updated_pages = s->updated_pages;
    s->updated_pages = 0;
    s->addr = 0;
    s->iteration++;
}

static void migrate_reset_throttle(void *opaque)
{
    MigrationState *s = opaque;

    s->bps = s->throttle_count;

    if (s->throttled) {
	s->throttled = 0;
	qemu_set_fd_handler2(s->fd, NULL, NULL, migrate_write, s);
    }
    s->throttle_count = 0;
    qemu_mod_timer(s->timer, qemu_get_clock(rt_clock) + 1000);
}

static int write_whole_buffer(int fd, const void *buff, size_t size)
{
    size_t offset = 0, len;

    while (offset < size) {
        len = write(fd, buff + offset, size - offset);
	if (len == -1 && errno == EINTR)
	    continue;
	if (len < 1)
	    return -EIO;
        
	offset += len;
    }
    return !(offset == size); /* returns 0 on success */
}

static int bit_is_set(int bit, unsigned char *map)
{
    return map[bit/8] & (1 << (bit%8));
}

static int start_migration(MigrationState *s)
{
    uint32_t value = cpu_to_be32(phys_ram_size);
    target_phys_addr_t addr;
    int r;

#ifdef USE_KVM
    int n = 0;
    unsigned char *phys_ram_page_exist_bitmap = NULL;
    if (kvm_allowed) {
        n = BITMAP_SIZE(phys_ram_size);
        phys_ram_page_exist_bitmap = qemu_malloc(n);
        if (!phys_ram_page_exist_bitmap) {
            perror("failed to allocate page bitmap");
            r = MIG_STAT_NO_MEM;
            goto out;
        }
        if (kvm_get_phys_ram_page_bitmap(phys_ram_page_exist_bitmap)) {
            r = MIG_STAT_KVM_GET_PAGE_BITMAP;
            perror("kvm_get_mem_map failed");
            goto out;
        }
    }
#endif
	
    r = MIG_STAT_WRITE_FAILED;
    if (write_whole_buffer(s->fd, &value, sizeof(value)))
        goto out;

#ifdef USE_KVM
    if (kvm_allowed) {
        if (write_whole_buffer(s->fd, phys_ram_page_exist_bitmap, n))
            goto out;
    }
#endif
    fcntl(s->fd, F_SETFL, O_NONBLOCK);

    for (addr = 0; addr < phys_ram_size; addr += TARGET_PAGE_SIZE) {
#ifdef USE_KVM
        if (kvm_allowed && !bit_is_set(addr>>TARGET_PAGE_BITS, phys_ram_page_exist_bitmap)) {
            cpu_physical_memory_reset_dirty(addr, 
                                            addr + TARGET_PAGE_SIZE, 
                                            MIGRATION_DIRTY_FLAG);
            continue;
        }
#endif
	if (!cpu_physical_memory_get_dirty(addr, MIGRATION_DIRTY_FLAG))
	    cpu_physical_memory_set_dirty(addr);
    }

    if (cpu_physical_memory_set_dirty_tracking(1)) {
        *s->has_error = MIG_STAT_KVM_SET_DIRTY_TRACKING_FAILED;
        return -1;
    }

    s->addr = 0;
    s->iteration = 0;
    s->updated_pages = 0;
    s->last_updated_pages = 0;
    s->n_buffer = s->l_buffer = 0;
    s->rapid_writes = 0;
    s->timer = qemu_new_timer(rt_clock, migrate_reset_throttle, s);

    qemu_mod_timer(s->timer, qemu_get_clock(rt_clock));
    qemu_set_fd_handler2(s->fd, NULL, NULL, migrate_write, s);

 out:
#ifdef USE_KVM
    if (phys_ram_page_exist_bitmap)
        qemu_free(phys_ram_page_exist_bitmap);
#endif
    return r;
}

static MigrationState *migration_init_fd(int detach, int fd)
{
    MigrationState *s;

    s = qemu_mallocz(sizeof(MigrationState));
    if (s == NULL) {
	term_printf("Allocation error\n");
	return NULL;
    }

    s->fd = fd;
    s->has_error = qemu_mallocz(sizeof(int));
    if (s->has_error == NULL) {
        term_printf("malloc failed (for has_error)\n");
        return NULL;
    }
    s->detach = detach;

    current_migration = s;
    
    if (start_migration(s) == -1) {
	term_printf("Could not start migration\n");
	return NULL;
    }

    if (!detach)
	monitor_suspend();

    return s;
}

typedef struct MigrationCmdState
{
    int fd;
    pid_t pid;
} MigrationCmdState;

static int cmd_release(void *opaque)
{
    MigrationCmdState *c = opaque;
    int status, ret;

    close(c->fd);

again:
    ret = waitpid(c->pid, &status, 0);
    if (ret == -1 && errno == EINTR)
	goto again;

    if (ret == -1) {
        term_printf("migration: waitpid failed (%s)\n", strerror(errno));
        return -1;
    }
    /* FIXME: check and uncomment
     * if (WIFEXITED(status))
     *     status = WEXITSTATUS(status);
     */
    return status;
}

static MigrationState *migration_init_cmd(int detach, const char *command, char **argv)
{
    int fds[2];
    pid_t pid;
    int i;
    MigrationState *s;

    if (pipe(fds) == -1) {
	term_printf("pipe() (%s)\n", strerror(errno));
	return NULL;
    }

    pid = fork();
    if (pid == -1) {
	close(fds[0]);
	close(fds[1]);
	term_printf("fork error (%s)\n", strerror(errno));
	return NULL;
    }
    if (pid == 0) {
	close(fds[1]);
	dup2(fds[0], STDIN_FILENO);
	execvp(command, argv);
	exit(1);
    } else
	close(fds[0]);

    for (i = 0; argv[i]; i++)
	qemu_free(argv[i]);
    qemu_free(argv);

    s = migration_init_fd(detach, fds[1]);
    if (s) {
	MigrationCmdState *c = qemu_mallocz(sizeof(*c));
	c->pid = pid;
	c->fd = fds[1];
	s->release = cmd_release;
	s->opaque = c;
    }

    return s;
}

static MigrationState *migration_init_exec(int detach, const char *command)
{
    char **argv = NULL;

    argv = qemu_mallocz(sizeof(char *) * 4);
    argv[0] = strdup("sh");
    argv[1] = strdup("-c");
    argv[2] = strdup(command);
    argv[3] = NULL;

    return migration_init_cmd(detach, "/bin/sh", argv);
}

static MigrationState *migration_init_ssh(int detach, const char *host)
{
    int qemu_argc, daemonize = 0, argc, i;
    char **qemu_argv, **argv;
    const char *incoming = NULL;
	
    qemu_get_launch_info(&qemu_argc, &qemu_argv, &daemonize, &incoming);

    argc = 3 + qemu_argc;
    if (!daemonize)
	argc++;
    if (!incoming)
	argc+=2;
    
    argv = qemu_mallocz(sizeof(char *) * (argc + 1));
    argv[0] = strdup("ssh");
    argv[1] = strdup("-XC");
    argv[2] = strdup(host);

    for (i = 0; i < qemu_argc; i++)
	argv[3 + i] = strdup(qemu_argv[i]);

    if (!daemonize)
	argv[3 + i++] = strdup("-daemonize");
    if (!incoming) {
	argv[3 + i++] = strdup("-incoming");
	argv[3 + i++] = strdup("stdio");
    }

    argv[3 + i] = NULL;

    return migration_init_cmd(detach, "ssh", argv);
}

/* (busy) wait timeout (miliseconds) for a message to arrive on fd. */
/* returns 0 on success error_code otherwise (18 for timeout) */
static int wait_for_message(const char *msg, int fd, int timeout)
{
    fd_set rfds;
    struct timeval tv;
    int64_t now, expiration, delta; /* milliseconds */
    int n = 0;

    now = qemu_get_clock(rt_clock);
    expiration = now + timeout;
    do {
        FD_ZERO(&rfds);
        FD_SET(fd, &rfds);
        tv.tv_sec = tv.tv_usec = 0;
        now = qemu_get_clock(rt_clock);
        delta = expiration - now;
        if (delta > 0)
            tv.tv_usec = delta * 1000;
        n = select(fd + 1, &rfds, NULL, NULL, &tv);
    } while ( (n == -1) && (errno == EINTR) );

    switch (n) {
    case -1: /* error */
        fprintf(stderr, "%s FAILED: ", msg);
        perror("");
        return MIG_STAT_SELECT_FAILED;
    case 0: /* timeout */
        fprintf(stderr, "%s: timeout reached\n", msg);
        return MIG_STAT_SELECT_TIMEOUT;
    case 1:
        break;
    default:
        fprintf(stderr, "wait_for_message: %s: select returned  %d\n", msg, n);
    }
    if (!FD_ISSET(fd, &rfds)) {
        fprintf(stderr, "wait_for_message: %s: s->fd not set\n", msg);
        return MIG_STAT_SELECT_FD_NOT_SET;
    }

    return 0;
}

static int tcp_release(void *opaque)
{
    MigrationState *s = opaque;
    uint8_t status = 0;
    ssize_t len = 0;
    int n;

    if (*s->has_error)
        goto out;

    n = wait_for_message("WAIT FOR ACK", s->fd, wait_for_message_timeout);
    if (n) {
        *s->has_error = n;
        goto out; 
    }

wait_for_ack:
    len = read(s->fd, &status, 1);
    if (len == -1 && errno == EINTR)
	goto wait_for_ack;
    if (len != 1 || status != 0) {
        *s->has_error = MIG_STAT_READ_FAILED;
        fprintf(stderr, "migration: wait_for_ack: read failed l=%ld s=%d\n",
                len, status);
        goto out;
    }

send_go:
    len = write(s->fd, &status, 1);
    if (len == -1 && errno == EINTR)
	goto send_go;
    if (len != 1) {
        fprintf(stderr, "migration: send_go: write failed l=%ld\n", len);
        *s->has_error = MIG_STAT_WRITE_FAILED;
    }

out:
    close(s->fd);

    return (len != 1 || status != 0);
}

static MigrationState *migration_init_tcp(int detach, const char *host)
{
    int fd;
    struct sockaddr_in addr;
    MigrationState *s;

    fd = socket(PF_INET, SOCK_STREAM, 0);
    if (fd == -1) {
        term_printf("socket() failed %s\n", strerror(errno));
        status = MIG_STAT_SOCKET_FAILED;
	return NULL;
    }

    addr.sin_family = AF_INET;
    if (parse_host_port(&addr, host) == -1) {
        term_printf("parse_host_port() FAILED for %s\n", host);
	close(fd);
        status = MIG_STAT_INVALID_ADDR;
	return NULL;
    }

again:
    if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
        if (errno == EINTR)
            goto again;
        term_printf("connect() failed %s\n", strerror(errno));
	close(fd);
        status = MIG_STAT_CONNECT_FAILED;
	return NULL;
    }

    s = migration_init_fd(detach, fd);
    if (s) {
	s->opaque = s;
	s->release = tcp_release;
    }
    return s;
}

/* Incoming migration */

static void migrate_incoming_homogeneous_page(uint32_t addr, uint32_t v)
{
    int i, n;
    uint32_t *p;
    
    n = TARGET_PAGE_SIZE / sizeof(v);
    p = (uint32 *)(phys_ram_base + addr);

    for (i=0; i<n; i++)
        p[i] = v;
}

static int migrate_incoming_page(QEMUFile *f, uint32_t addr)
{
    int l, v, ret = 0;

    switch (qemu_get_byte(f)) {
    case 0: /* the whole page */
        l = qemu_get_buffer(f, phys_ram_base + addr, TARGET_PAGE_SIZE);
        if (l != TARGET_PAGE_SIZE)
            ret = MIG_STAT_DST_GET_PAGE_FAILED;
        break;
    case 1: /* homogeneous page -- a single byte */
        v = qemu_get_be32(f);
        migrate_incoming_homogeneous_page(addr, v);
        break;
    default: 
        ret = MIG_STAT_DST_GET_PAGE_UNKNOWN_TYPE;
    }
    
    return ret;
}

static int migrate_incoming_fd(int fd)
{
    int ret = 0;
    QEMUFile *f = qemu_fopen_fd(fd);
    uint32_t addr;
    extern void qemu_announce_self(void);

    if (qemu_get_be32(f) != phys_ram_size)
	return MIG_STAT_DST_MEM_SIZE_MISMATCH;

#ifdef USE_KVM
    if (kvm_allowed) {
        int n, i;
        unsigned char *phys_ram_page_exist_bitmap = NULL;

        /* allocate memory bitmap */
        n = BITMAP_SIZE(phys_ram_size);
        phys_ram_page_exist_bitmap = qemu_malloc(n);
        if (!phys_ram_page_exist_bitmap) {
            perror("failed to allocate page bitmap");
            return MIG_STAT_NO_MEM;
        }
        
        /* receive memory bitmap */
        qemu_get_buffer(f, phys_ram_page_exist_bitmap, n);
        /* free dellocated-at-src memory */
        /* FIXME: currently just print a message */
        for (i=0; i<n; i++) {
            if (phys_ram_page_exist_bitmap[i] != 0xFF)
                printf("phys_ram_page_exist_bitmap[%d]=0x%x\n", 
                       i, phys_ram_page_exist_bitmap[i]);
        }

        qemu_free(phys_ram_page_exist_bitmap);
    }
#endif

    do {
	addr = qemu_get_be32(f);
	if (addr == 1)
	    break;
        ret = migrate_incoming_page(f, addr);
        if (ret)
            return ret;
    } while (1);


    qemu_aio_flush();
    vm_stop(0);
    if (qemu_live_loadvm_state(f))
        ret = MIG_STAT_DST_LOADVM_FAILED;
#ifdef MIGRATION_VERIFY
    if (ret==0) ret=load_verify_memory(f, NULL, 1);
#endif /* MIGRATION_VERIFY */
    qemu_fclose(f);

    return ret;
}

static int migrate_incoming_tcp(const char *host)
{
    struct sockaddr_in addr;
    socklen_t addrlen = sizeof(addr);
    int fd, sfd;
    ssize_t len;
    uint8_t status = 0;
    int reuse = 1;
    int rc;

    addr.sin_family = AF_INET;
    if (parse_host_port(&addr, host) == -1) {
        fprintf(stderr, "parse_host_port() failed for %s\n", host);
        rc = MIG_STAT_DST_INVALID_ADDR;
	goto error;
    }

    fd = socket(PF_INET, SOCK_STREAM, 0);
    if (fd == -1) {
        perror("socket failed");
        rc = MIG_STAT_DST_SOCKET_FAILED;
	goto error;
    }

    if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &reuse, sizeof(reuse)) == -1) {
        perror("setsockopt() failed");
        rc = MIG_STAT_DST_SOCKOPT_FAILED;
	goto error_socket;
    }

    if (bind(fd, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
        perror("bind() failed");
        rc = MIG_STAT_DST_BIND_FAILED;
	goto error_socket;
    }

    if (listen(fd, 1) == -1) {
        perror("listen() failed");
        rc = MIG_STAT_DST_LISTEN_FAILED;
	goto error_socket;
    }

again:
    sfd = accept(fd, (struct sockaddr *)&addr, &addrlen);
    if (sfd == -1) {
	if (errno == EINTR)
	    goto again;
        perror("accept() failed");
        rc = MIG_STAT_DST_ACCEPT_FAILED;
	goto error_socket;
    }

    rc = migrate_incoming_fd(sfd);
    if (rc != 0) {
        fprintf(stderr, "migrate_incoming_fd failed (rc=%d)\n", rc);
	goto error_accept;
    }

send_ack:
    len = write(sfd, &status, 1);
    if (len == -1 && errno == EAGAIN)
	goto send_ack;
    if (len != 1) {
        rc = MIG_STAT_DST_WRITE_FAILED;
	goto error_accept;
    }

    rc = wait_for_message("WAIT FOR GO", sfd, wait_for_message_timeout);
    if (rc) {
        rc += 200;
        goto error_accept;
    }

wait_for_go:
    len = read(sfd, &status, 1);
    if (len == -1 && errno == EAGAIN)
	goto wait_for_go;
    if (len != 1)
        rc = MIG_STAT_DST_READ_FAILED;

error_accept:
    close(sfd);
error_socket:
    close(fd);
error:
    return rc;
}

int migrate_incoming(const char *device)
{
    const char *ptr;
    int ret = 0;

    if (strcmp(device, "stdio") == 0)
	ret = migrate_incoming_fd(STDIN_FILENO);
    else if (strstart(device, "tcp://", &ptr)) {
	char *host, *end;
	host = strdup(ptr);
	end = strchr(host, '/');
	if (end) *end = 0;
	ret = migrate_incoming_tcp(host);
	qemu_free(host);
    } else {
	errno = EINVAL;
	ret = MIG_STAT_DST_INVALID_PARAMS;
    }

    return ret;
}

/* Migration monitor command */

/* TODO:
   1) audit all error paths
*/

void do_migrate(int detach, const char *uri)
{
    const char *ptr;

    status = MIG_STAT_INVALID_PARAMS;
    if (strstart(uri, "exec:", &ptr)) {
	char *command = urldecode(ptr);
	migration_init_exec(detach, command);
	free(command);
    } else if (strstart(uri, "ssh://", &ptr)) {
	char *host, *end;

	host = strdup(ptr);
	end = strchr(host, '/');
	if (end) *end = 0;
	migration_init_ssh(detach, host);
	qemu_free(host);
    } else if (strstart(uri, "tcp://", &ptr)) {
	char *host, *end;

	host = strdup(ptr);
	end = strchr(host, '/');
	if (end) *end = 0;

	if (migration_init_tcp(detach, host) == NULL)
            term_printf("migration failed (migration_init_tcp for %s failed)\n", host);
	free(host);
    } else {
	term_printf("Unknown migration protocol '%s'\n", uri);
	return;
    }
}

void do_migrate_set_speed(const char *value)
{
    double d;
    char *ptr;

    d = strtod(value, &ptr);
    switch (*ptr) {
    case 'G': case 'g':
	d *= 1024;
    case 'M': case 'm':
	d *= 1024;
    case 'K': case 'k':
	d *= 1024;
    default:
	break;
    }

    max_throttle = (uint32_t)d;
}

void do_info_migration(void)
{
    MigrationState *s = current_migration;

    if (s) {
	term_printf("Migration active\n");
	if (s->bps < (1 << 20))
	    term_printf("Transfer rate %3.1f kb/s\n",
			(double)s->bps / 1024);
	else
	    term_printf("Transfer rate %3.1f mb/s\n",
			(double)s->bps / (1024 * 1024));
	term_printf("Iteration %d\n", s->iteration);
	term_printf("Transferred %d/%d pages\n", s->updated_pages, phys_ram_size >> TARGET_PAGE_BITS);
	if (s->iteration)
	    term_printf("Last iteration found %d dirty pages\n", s->last_updated_pages);
    } else
	term_printf("Migration inactive\n");

    term_printf("Maximum migration speed is ");
    if (max_throttle < (1 << 20))
	term_printf("%3.1f kb/s\n", (double)max_throttle / 1024);
    else
	term_printf("%3.1f mb/s\n", (double)max_throttle / (1024 * 1024));
    term_printf("last migration status is %d\n", status);
}

void do_migrate_cancel(void)
{
    MigrationState *s = current_migration;

    if (s)
	*s->has_error = MIG_STAT_MIGRATION_CANCEL;
}



#ifdef MIGRATION_VERIFY
unsigned int calc_page_checksum(target_ulong addr)
{
    unsigned int sum=0;
    unsigned int *p = (unsigned int *)(phys_ram_base + addr);
    unsigned int *q = p + (TARGET_PAGE_SIZE / sizeof(unsigned int));

    for ( /*initialized already */ ; p<q ; p++)
        sum += *p;
    return sum;
}


static int save_verify_memory(QEMUFile *f, void *opaque)
{
    unsigned int addr;
    unsigned int sum;

    for (addr = 0; addr < phys_ram_size; addr += TARGET_PAGE_SIZE) {
#ifdef USE_KVM
        if (kvm_allowed && (addr>=0xa0000) && (addr<0xc0000)) /* do not access video-addresses */
            continue;
#endif
        sum = calc_page_checksum(addr);
        qemu_put_be32(f, addr);
        qemu_put_be32(f, sum);
    }
    return 0;
}

static int load_verify_memory(QEMUFile *f, void *opaque, int version_id)
{
    unsigned int addr, raddr;
    unsigned int sum, rsum;
    int num_errors = 0;
    
    for (addr = 0; addr < phys_ram_size; addr += TARGET_PAGE_SIZE) {
#ifdef USE_KVM
        if (kvm_allowed && (addr>=0xa0000) && (addr<0xc0000)) /* do not access video-addresses */
            continue;
#endif
        sum = calc_page_checksum(addr);
        raddr = qemu_get_be32(f);
        rsum  = qemu_get_be32(f);
        if ((raddr != addr) || (rsum != sum)) {
            term_printf("checksum mismatch: src:0x%x 0x%x , dst:0x%x 0x%x\n",
                    raddr, rsum, addr, sum);
            num_errors++;
        }
    }
    printf("memory_verify: num_errors=%d\n", num_errors);
    term_printf("memory_verify: num_errors=%d\n", num_errors);
    return 0/* num_errors */;
}
#endif /* MIGRATION_VERIFY */
