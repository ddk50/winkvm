
/* Common header file that is included by all of qemu.  */
#ifndef QEMU_COMMON_H
#define QEMU_COMMON_H

/* we put basic includes here to avoid repeating them in device drivers */
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <inttypes.h>
#include <limits.h>
#include <time.h>
#include <ctype.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

#ifndef O_LARGEFILE
#define O_LARGEFILE 0
#endif
#ifndef O_BINARY
#define O_BINARY 0
#endif

#ifndef ENOMEDIUM
#define ENOMEDIUM ENODEV
#endif

#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#define fsync _commit
#define lseek _lseeki64
#define ENOTSUP 4096
extern int qemu_ftruncate64(int, int64_t);
#define ftruncate qemu_ftruncate64


static inline char *realpath(const char *path, char *resolved_path)
{
    _fullpath(resolved_path, path, _MAX_PATH);
    return resolved_path;
}

#define PRId64 "I64d"
#define PRIx64 "I64x"
#define PRIu64 "I64u"
#define PRIo64 "I64o"
#endif

/* FIXME: Remove NEED_CPU_H.  */
#ifndef NEED_CPU_H

#include "config-host.h"
#include <setjmp.h>
#include "osdep.h"
#include "bswap.h"

#else

#include "cpu.h"

#endif /* !defined(NEED_CPU_H) */

/* bottom halves */
typedef struct QEMUBH QEMUBH;

typedef void QEMUBHFunc(void *opaque);

QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque);
void qemu_bh_schedule(QEMUBH *bh);
void qemu_bh_cancel(QEMUBH *bh);
void qemu_bh_delete(QEMUBH *bh);
int qemu_bh_poll(void);

uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);

/* cutils.c */
void pstrcpy(char *buf, int buf_size, const char *str);
char *pstrcat(char *buf, int buf_size, const char *s);
int strstart(const char *str, const char *val, const char **ptr);
int stristart(const char *str, const char *val, const char **ptr);
time_t mktimegm(struct tm *tm);
char *urldecode(const char *ptr);

/* Error handling.  */

void hw_error(const char *fmt, ...)
    __attribute__ ((__format__ (__printf__, 1, 2)))
    __attribute__ ((__noreturn__));

/* IO callbacks.  */
typedef void IOReadHandler(void *opaque, const uint8_t *buf, int size);
typedef int IOCanRWHandler(void *opaque);
typedef void IOHandler(void *opaque);

struct ParallelIOArg {
    void *buffer;
    int count;
};

typedef int (*DMA_transfer_handler) (void *opaque, int nchan, int pos, int size);

/* A load of opaque types so that device init declarations don't have to
   pull in all the real definitions.  */
typedef struct NICInfo NICInfo;
typedef struct AudioState AudioState;
typedef struct BlockDriverState BlockDriverState;
typedef struct DisplayState DisplayState;
typedef struct TextConsole TextConsole;
typedef struct CharDriverState CharDriverState;
typedef struct VLANState VLANState;
typedef struct QEMUFile QEMUFile;
typedef struct i2c_bus i2c_bus;
typedef struct i2c_slave i2c_slave;
typedef struct SMBusDevice SMBusDevice;
typedef struct QEMUTimer QEMUTimer;
typedef struct PCIBus PCIBus;
typedef struct PCIDevice PCIDevice;
typedef struct SerialState SerialState;
typedef struct IRQState *qemu_irq;
struct pcmcia_card_s;

/* addition for ddk */
void do_migrate(int detach, const char *uri);
void do_migrate_set_speed(const char *value);
void do_migrate_cancel(void);

/* few addition for ddk  */
int migrate_incoming(const char *device);

/* defined at vl.c */
void vm_start(void);
void vm_stop(int reason);

/* migration.c */
void do_info_migration(void);
void do_migrate(int detach, const char *uri);
void do_migrate_cancel(void);
void do_migrate_set_speed(const char *value);
int migrate_incoming(const char *device);

/* monitor.c */
void monitor_init(CharDriverState *hd, int show_banner);
void term_puts(const char *str);
void term_vprintf(const char *fmt, va_list ap);
void term_printf(const char *fmt, ...) __attribute__ ((__format__ (__printf__, 1, 2)));
void term_print_filename(const char *filename);
void term_flush(void);
void term_print_help(void);
void monitor_readline(const char *prompt, int is_password,
                      char *buf, int buf_size);
void monitor_suspend(void);
void monitor_resume(void);

/* vl.c */
void qemu_get_launch_info(int *argc, char ***argv, int *opt_daemonize, const char **opt_incoming);

//struct QEMUFile;

int qemu_live_savevm_state(QEMUFile *f);
int qemu_live_loadvm_state(QEMUFile *f);

//typedef struct QEMUFile QEMUFile;

typedef void (QEMUFilePutBufferFunc)(void *opaque, const uint8_t *buf, int64_t pos, int size);
typedef int (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf, int64_t pos, int size);
typedef void (QEMUFileCloseFunc)(void *opaque);

QEMUFile *qemu_fopen_compat(void *opaque, QEMUFilePutBufferFunc *put_buffer,
			    QEMUFileGetBufferFunc *get_buffer, QEMUFileCloseFunc *close);

QEMUFile *qemu_fopen_fd(int fd);

#endif
