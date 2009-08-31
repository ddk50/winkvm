
/*
 * Kernel-based Virtual Machine control library
 *
 * This library provides an API to control the kvm hardware virtualization
 * module.
 *
 * Copyright (C) 2006 Qumranet
 *
 * Authors:
 *  Avi Kivity <avi@qumranet.com>
 *  Yaniv Kamay <yaniv@qumranet.com>
 * Few addition by kazushi takahashi
 *
 * This work is licensed under the GNU LGPL license, version 2.
 */

#ifndef __user
#define __user /* temporary, until installed via make headers_install */
#endif

#include <linux/kvm.h>

#define EXPECTED_KVM_API_VERSION 12

#if EXPECTED_KVM_API_VERSION != KVM_API_VERSION
#error libkvm: userspace and kernel version mismatch
#endif

#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <inttypes.h>
#include "libkvm.h"

#if defined(__x86_64__) || defined(__i386__)
#include "kvm-x86.h"
#endif

#if defined(__ia64__)
#include "kvm-ia64.h"
#endif

#if defined(__powerpc__)
#include "kvm-powerpc.h"
#endif

#if defined(__s390__)
#include "kvm-s390.h"
#endif

//#define DEBUG_MEMREG
#ifdef	DEBUG_MEMREG
#define DPRINTF(fmt, args...)											\
  do { fprintf(stderr, "%s:%d " fmt , __func__, __LINE__, ##args); } while (0)
#else
#define DPRINTF(fmt, args...) do {} while (0)
#endif


int kvm_abi = EXPECTED_KVM_API_VERSION;
int kvm_page_size;

struct slot_info {
  unsigned long phys_addr;
  unsigned long len;
  unsigned long userspace_addr;
  unsigned flags;
  int logging_count;
};

struct slot_info slots[KVM_MAX_NUM_MEM_REGIONS];

static void init_slots(void)
{
  int i;

  for (i = 0; i < KVM_MAX_NUM_MEM_REGIONS; ++i)
	slots[i].len = 0;

}

static int get_free_slot(kvm_context_t kvm)
{
  int i;
  int tss_ext;

#if defined(KVM_CAP_SET_TSS_ADDR) && !defined(__s390__)
  tss_ext = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_SET_TSS_ADDR);
#else
  tss_ext = 0;
#endif

  /*
   * on older kernels where the set tss ioctl is not supprted we must save
   * slot 0 to hold the extended memory, as the vmx will use the last 3
   * pages of this slot.
   */
  if (tss_ext > 0)
	i = 0;
  else
	i = 1;

  for (; i < KVM_MAX_NUM_MEM_REGIONS; ++i)

	if (!slots[i].len)
	  return i;
  return -1;
}

static void register_slot(int slot, unsigned long phys_addr, unsigned long len,
						  unsigned long userspace_addr, unsigned flags)
{
  slots[slot].phys_addr = phys_addr;
  slots[slot].len = len;
  slots[slot].userspace_addr = userspace_addr;
  slots[slot].flags = flags;
}

static void free_slot(int slot)
{
  slots[slot].len = 0;
  slots[slot].logging_count = 0;
}

static int get_slot(unsigned long phys_addr)
{
  int i;

  for (i = 0; i < KVM_MAX_NUM_MEM_REGIONS ; ++i) {
	if (slots[i].len && slots[i].phys_addr <= phys_addr &&
		(slots[i].phys_addr + slots[i].len-1) >= phys_addr)
	  return i;
  }
  return -1;
}

/* Returns -1 if this slot is not totally contained on any other,
 * and the number of the slot otherwise */
static int get_container_slot(uint64_t phys_addr, unsigned long size)  
{
  int i;

  for (i = 0; i < KVM_MAX_NUM_MEM_REGIONS ; ++i)
	if (slots[i].len && slots[i].phys_addr <= phys_addr &&
		(slots[i].phys_addr + slots[i].len) >= phys_addr + size)
	  return i;
  return -1;
}

int kvm_is_containing_region(kvm_context_t kvm, unsigned long phys_addr, unsigned long size)
{
  int slot = get_container_slot(phys_addr, size);
  if (slot == -1)
	return 0;
  return 1;
}

/* 
 * dirty pages logging control 
 */
static int kvm_dirty_pages_log_change(kvm_context_t kvm,
									  unsigned long phys_addr,
									  unsigned flags,
									  unsigned mask)  
{
  int r = -1;
  int slot = get_slot(phys_addr);

  if (slot == -1) {
	fprintf(stderr, "BUG: %s: invalid parameters\n", __FUNCTION__);
	return 1;
  }

  flags = (slots[slot].flags & ~mask) | flags;
  if (flags == slots[slot].flags)
	return 0;
  slots[slot].flags = flags;

  {
	struct kvm_userspace_memory_region mem = {
	  .slot = slot,
	  .memory_size = slots[slot].len,
	  .guest_phys_addr = slots[slot].phys_addr,
	  .userspace_addr = slots[slot].userspace_addr,
	  .flags = slots[slot].flags,			
	};


	DPRINTF("slot %d start %llx len %llx flags %x\n",
			mem.slot,
			mem.guest_phys_addr,
			mem.memory_size,
			mem.flags);
	r = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION, &mem);
	if (r == -1)
	  fprintf(stderr, "%s: %m\n", __FUNCTION__);
  }
  return r;
}

static int kvm_dirty_pages_log_change_all(kvm_context_t kvm,
										  int (*change)(kvm_context_t kvm,
														uint64_t start,
														uint64_t len))
{
  int i, r;

  for (i=r=0; i<KVM_MAX_NUM_MEM_REGIONS && r==0; i++) {
	if (slots[i].len)
	  r = change(kvm, slots[i].phys_addr, slots[i].len);
  }
  return r;
}

int kvm_dirty_pages_log_enable_slot(kvm_context_t kvm,
									uint64_t phys_addr,
									uint64_t len)
{
  int slot = get_slot(phys_addr);

  DPRINTF("start %"PRIx64" len %"PRIx64"\n", phys_addr, len);
  if (slot == -1) {
	fprintf(stderr, "BUG: %s: invalid parameters\n", __func__);
	return -EINVAL;
  }

  if (slots[slot].logging_count++)
	return 0;

  return kvm_dirty_pages_log_change(kvm, slots[slot].phys_addr,
									KVM_MEM_LOG_DIRTY_PAGES,
									KVM_MEM_LOG_DIRTY_PAGES);
}

int kvm_dirty_pages_log_disable_slot(kvm_context_t kvm,
									 uint64_t phys_addr,
									 uint64_t len)
{
  int slot = get_slot(phys_addr);

  if (slot == -1) {
	fprintf(stderr, "BUG: %s: invalid parameters\n", __func__);
	return -EINVAL;
  }

  if (--slots[slot].logging_count)
	return 0;

  return kvm_dirty_pages_log_change(kvm, slots[slot].phys_addr,
									0,
									KVM_MEM_LOG_DIRTY_PAGES);
}

/**
 * Enable dirty page logging for all memory regions
 */
int kvm_dirty_pages_log_enable_all(kvm_context_t kvm)
{
  if (kvm->dirty_pages_log_all)
	return 0;
  kvm->dirty_pages_log_all = 1;
  return kvm_dirty_pages_log_change_all(kvm,
										kvm_dirty_pages_log_enable_slot);
}

/**
 * Enable dirty page logging only for memory regions that were created with
 *     dirty logging enabled (disable for all other memory regions).
 */
int kvm_dirty_pages_log_reset(kvm_context_t kvm)
{
  if (!kvm->dirty_pages_log_all)
	return 0;
  kvm->dirty_pages_log_all = 0;
  return kvm_dirty_pages_log_change_all(kvm,
										kvm_dirty_pages_log_disable_slot);
}


kvm_context_t kvm_init(struct kvm_callbacks *callbacks,
					   void *opaque)
{
  int fd;
  kvm_context_t kvm;
  int r;

  fd = open("/dev/kvm", O_RDWR);
  if (fd == -1) {
	perror("open /dev/kvm");
	return NULL;
  }
  r = ioctl(fd, KVM_GET_API_VERSION, 0);
  if (r == -1) {
	fprintf(stderr, "kvm kernel version too old: "
		    "KVM_GET_API_VERSION ioctl not supported\n");
	goto out_close;
  }
  if (r < EXPECTED_KVM_API_VERSION) {
	fprintf(stderr, "kvm kernel version too old: "
			"We expect API version %d or newer, but got "
			"version %d\n",
			EXPECTED_KVM_API_VERSION, r);
	goto out_close;
  }
  if (r > EXPECTED_KVM_API_VERSION) {
	fprintf(stderr, "kvm userspace version too old\n");
	goto out_close;
  }
  kvm_abi = r;
  kvm_page_size = getpagesize();
  kvm = malloc(sizeof(*kvm));
  if (kvm == NULL)
	goto out_close;
  memset(kvm, 0, sizeof(*kvm));
  kvm->fd = fd;
  kvm->vm_fd = -1;
  kvm->callbacks = callbacks;
  kvm->opaque = opaque;
  kvm->dirty_pages_log_all = 0;
  kvm->no_irqchip_creation = 0;
  kvm->no_pit_creation = 0;

  return kvm;
 out_close:
  close(fd);
  return NULL;
}

void kvm_finalize(kvm_context_t kvm)
{
  if (kvm->vcpu_fd[0] != -1)
	close(kvm->vcpu_fd[0]);
  if (kvm->vm_fd != -1)
	close(kvm->vm_fd);
  close(kvm->fd);
  free(kvm);
}

void kvm_disable_irqchip_creation(kvm_context_t kvm)
{
  kvm->no_irqchip_creation = 1;
}

void kvm_disable_pit_creation(kvm_context_t kvm)
{
  kvm->no_pit_creation = 1;
}

int kvm_create_vcpu(kvm_context_t kvm, int slot)
{
  long mmap_size;
  int r;

  r = ioctl(kvm->vm_fd, KVM_CREATE_VCPU, slot);
  if (r == -1) {
	r = -errno;
	fprintf(stderr, "kvm_create_vcpu: %m\n");
	return r;
  }
  kvm->vcpu_fd[slot] = r;
  mmap_size = ioctl(kvm->fd, KVM_GET_VCPU_MMAP_SIZE, 0);
  if (mmap_size == -1) {
	r = -errno;
	fprintf(stderr, "get vcpu mmap size: %m\n");
	return r;
  }
  kvm->run[slot] = mmap(NULL, mmap_size, PROT_READ|PROT_WRITE, MAP_SHARED,
						kvm->vcpu_fd[slot], 0);
  if (kvm->run[slot] == MAP_FAILED) {
	r = -errno;
	fprintf(stderr, "mmap vcpu area: %m\n");
	return r;
  }
  return 0;
}

int kvm_create_vm(kvm_context_t kvm)
{
  int fd = kvm->fd;

#ifdef KVM_CAP_IRQ_ROUTING
  kvm->irq_routes = malloc(sizeof(*kvm->irq_routes));
  if (!kvm->irq_routes)
	return -ENOMEM;
  memset(kvm->irq_routes, 0, sizeof(*kvm->irq_routes));
  kvm->nr_allocated_irq_routes = 0;
#endif

  kvm->vcpu_fd[0] = -1;

  fd = ioctl(fd, KVM_CREATE_VM, 0);
  if (fd == -1) {
	fprintf(stderr, "kvm_create_vm: %m\n");
	return -1;
  }
  kvm->vm_fd = fd;
  return 0;
}

static int kvm_create_default_phys_mem(kvm_context_t kvm,
									   unsigned long phys_mem_bytes,
									   void **vm_mem)
{
#ifdef KVM_CAP_USER_MEMORY
  int r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_USER_MEMORY);
  if (r > 0)
	return 0;
  fprintf(stderr, "Hypervisor too old: KVM_CAP_USER_MEMORY extension not supported\n");
#else
#error Hypervisor too old: KVM_CAP_USER_MEMORY extension not supported
#endif
  return -1;
}

int kvm_check_extension(kvm_context_t kvm, int ext)
{
  int ret;

  ret = ioctl(kvm->fd, KVM_CHECK_EXTENSION, ext);
  if (ret > 0)
	return ret;
  return 0;
}

void kvm_create_irqchip(kvm_context_t kvm)
{
  int r;

  kvm->irqchip_in_kernel = 0;
#ifdef KVM_CAP_IRQCHIP
  if (!kvm->no_irqchip_creation) {
	r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_IRQCHIP);
	if (r > 0) {	/* kernel irqchip supported */
	  r = ioctl(kvm->vm_fd, KVM_CREATE_IRQCHIP);
	  if (r >= 0) {
		kvm->irqchip_inject_ioctl = KVM_IRQ_LINE;
#if defined(KVM_CAP_IRQ_INJECT_STATUS) && defined(KVM_IRQ_LINE_STATUS)
		r = ioctl(kvm->fd, KVM_CHECK_EXTENSION,
				  KVM_CAP_IRQ_INJECT_STATUS);
		if (r > 0)
		  kvm->irqchip_inject_ioctl = KVM_IRQ_LINE_STATUS;
#endif
		kvm->irqchip_in_kernel = 1;
	  }
	  else
		fprintf(stderr, "Create kernel PIC irqchip failed\n");
	}
  }
#endif
}

int kvm_create(kvm_context_t kvm, unsigned long phys_mem_bytes, void **vm_mem)
{
  int r;
	
  r = kvm_create_vm(kvm);
  if (r < 0)
	return r;
  r = kvm_arch_create(kvm, phys_mem_bytes, vm_mem);
  if (r < 0)
	return r;
  init_slots();
  r = kvm_create_default_phys_mem(kvm, phys_mem_bytes, vm_mem);
  if (r < 0)
	return r;
  kvm_create_irqchip(kvm);

  return 0;
}


void *kvm_create_phys_mem(kvm_context_t kvm, unsigned long phys_start,
						  unsigned long len, int log, int writable)
{
  int r;
  int prot = PROT_READ;
  void *ptr;
  struct kvm_userspace_memory_region memory = {
	.memory_size = len,
	.guest_phys_addr = phys_start,
	.flags = log ? KVM_MEM_LOG_DIRTY_PAGES : 0,
  };

  if (writable)
	prot |= PROT_WRITE;

#if !defined(__s390__)
  ptr = mmap(NULL, len, prot, MAP_ANONYMOUS | MAP_SHARED, -1, 0);
#else
  ptr = mmap(LIBKVM_S390_ORIGIN, len, prot | PROT_EXEC,
			 MAP_FIXED | MAP_SHARED | MAP_ANONYMOUS, -1, 0);
#endif
  if (ptr == MAP_FAILED) {
	fprintf(stderr, "%s: %s", __func__, strerror(errno));
	return 0;
  }

  memset(ptr, 0, len);

  memory.userspace_addr = (unsigned long)ptr;
  memory.slot = get_free_slot(kvm);
  DPRINTF("slot %d start %llx len %llx flags %x\n",
		  memory.slot,
		  memory.guest_phys_addr,
		  memory.memory_size,
		  memory.flags);
  r = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION, &memory);
  if (r == -1) {
	fprintf(stderr, "%s: %s", __func__, strerror(errno));
	return 0;
  }
  register_slot(memory.slot, memory.guest_phys_addr, memory.memory_size,
				memory.userspace_addr, memory.flags);

  return ptr;
}

int kvm_register_phys_mem(kvm_context_t kvm,
						  unsigned long phys_start, void *userspace_addr,
						  unsigned long len, int log)
{

  struct kvm_userspace_memory_region memory = {
	.memory_size = len,
	.guest_phys_addr = phys_start,
	.userspace_addr = (unsigned long)(intptr_t)userspace_addr,
	.flags = log ? KVM_MEM_LOG_DIRTY_PAGES : 0,
  };
  int r;

  memory.slot = get_free_slot(kvm);
  DPRINTF("memory: gpa: %llx, size: %llx, uaddr: %llx, slot: %x, flags: %lx\n",
		  memory.guest_phys_addr, memory.memory_size,
		  memory.userspace_addr, memory.slot, memory.flags);
  r = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION, &memory);
  if (r == -1) {
	fprintf(stderr, "create_userspace_phys_mem: %s\n", strerror(errno));
	return -1;
  }
  register_slot(memory.slot, memory.guest_phys_addr, memory.memory_size,
				memory.userspace_addr, memory.flags);
  return 0;
}


/* destroy/free a whole slot.
 * phys_start, len and slot are the params passed to kvm_create_phys_mem()
 */
void kvm_destroy_phys_mem(kvm_context_t kvm, unsigned long phys_start, 
						  unsigned long len)
{
  int slot;
  int r;
  struct kvm_userspace_memory_region memory = {
	.memory_size = 0,
	.guest_phys_addr = phys_start,
	.userspace_addr = 0,
	.flags = 0,
  };

  slot = get_slot(phys_start);

  if ((slot >= KVM_MAX_NUM_MEM_REGIONS) || (slot == -1)) {
	fprintf(stderr, "BUG: %s: invalid parameters (slot=%d)\n",
			__FUNCTION__, slot);
	return;
  }
  if (phys_start != slots[slot].phys_addr) {
	fprintf(stderr,
			"WARNING: %s: phys_start is 0x%lx expecting 0x%lx\n",
			__FUNCTION__, phys_start, slots[slot].phys_addr);
	phys_start = slots[slot].phys_addr;
  }

  memory.slot = slot;
  DPRINTF("slot %d start %llx len %llx flags %x\n",
		  memory.slot,
		  memory.guest_phys_addr,
		  memory.memory_size,
		  memory.flags);
  r = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION, &memory);
  if (r == -1) {
	fprintf(stderr, "destroy_userspace_phys_mem: %s",
			strerror(errno));
	return;
  }

  free_slot(memory.slot);
}

void kvm_unregister_memory_area(kvm_context_t kvm, uint64_t phys_addr, unsigned long size)
{

  int slot = get_container_slot(phys_addr, size);

  if (slot != -1) {
	DPRINTF("Unregistering memory region %llx (%lx)\n", phys_addr, size);
	kvm_destroy_phys_mem(kvm, phys_addr, size);
	return;
  }
}

static int kvm_get_map(kvm_context_t kvm, int ioctl_num, int slot, void *buf)
{
  int r;
  struct kvm_dirty_log log = {
	.slot = slot,
  };

  log.dirty_bitmap = buf;

  r = ioctl(kvm->vm_fd, ioctl_num, &log);
  if (r == -1)
	return -errno;
  return 0;
}

int kvm_get_dirty_pages(kvm_context_t kvm, unsigned long phys_addr, void *buf)
{
  int slot;

  slot = get_slot(phys_addr);
  return kvm_get_map(kvm, KVM_GET_DIRTY_LOG, slot, buf);
}

#define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
#define BITMAP_SIZE(m) (ALIGN(((m)/PAGE_SIZE), sizeof(long) * 8) / 8)

int kvm_get_dirty_pages_range(kvm_context_t kvm, unsigned long phys_addr,
							  unsigned long len, void *buf, void *opaque,
							  int (*cb)(unsigned long start, unsigned long len,
										void*bitmap, void *opaque))
{
  int i;
  int r;
  unsigned long end_addr = phys_addr + len;

  for (i = 0; i < KVM_MAX_NUM_MEM_REGIONS; ++i) {
	if ((slots[i].len && (uint64_t)slots[i].phys_addr >= phys_addr)
		&& ((uint64_t)slots[i].phys_addr + slots[i].len  <= end_addr)) {
	  r = kvm_get_map(kvm, KVM_GET_DIRTY_LOG, i, buf);
	  if (r)
		return r;
	  r = cb(slots[i].phys_addr, slots[i].len, buf, opaque);
	  if (r)
		return r;
	}
  }
  return 0;
}

#ifdef KVM_CAP_IRQCHIP

int kvm_set_irq_level(kvm_context_t kvm, int irq, int level, int *status)
{
  struct kvm_irq_level event;
  int r;

  if (!kvm->irqchip_in_kernel)
	return 0;
  event.level = level;
  event.irq = irq;
  r = ioctl(kvm->vm_fd, kvm->irqchip_inject_ioctl, &event);
  if (r == -1)
	perror("kvm_set_irq_level");

  if (status) {
#ifdef KVM_CAP_IRQ_INJECT_STATUS
	*status = (kvm->irqchip_inject_ioctl == KVM_IRQ_LINE) ?
	  1 : event.status;
#else
	*status = 1;
#endif
  }

  return 1;
}

int kvm_get_irqchip(kvm_context_t kvm, struct kvm_irqchip *chip)
{
  int r;

  if (!kvm->irqchip_in_kernel)
	return 0;
  r = ioctl(kvm->vm_fd, KVM_GET_IRQCHIP, chip);
  if (r == -1) {
	r = -errno;
	perror("kvm_get_irqchip\n");
  }
  return r;
}

int kvm_set_irqchip(kvm_context_t kvm, struct kvm_irqchip *chip)
{
  int r;

  if (!kvm->irqchip_in_kernel)
	return 0;
  r = ioctl(kvm->vm_fd, KVM_SET_IRQCHIP, chip);
  if (r == -1) {
	r = -errno;
	perror("kvm_set_irqchip\n");
  }
  return r;
}

#endif

static int handle_io(kvm_context_t kvm, struct kvm_run *run, int vcpu)
{
  uint16_t addr = run->io.port;
  int r;
  int i;
  void *p = (void *)run + run->io.data_offset;

  for (i = 0; i < run->io.count; ++i) {
	switch (run->io.direction) {
	case KVM_EXIT_IO_IN:
	  switch (run->io.size) {
	  case 1:
		r = kvm->callbacks->inb(kvm->opaque, addr, p);
		break;
	  case 2:
		r = kvm->callbacks->inw(kvm->opaque, addr, p);
		break;
	  case 4:
		r = kvm->callbacks->inl(kvm->opaque, addr, p);
		break;
	  default:
		fprintf(stderr, "bad I/O size %d\n", run->io.size);
		return -EMSGSIZE;
	  }
	  break;
	case KVM_EXIT_IO_OUT:
	  switch (run->io.size) {
	  case 1:
		r = kvm->callbacks->outb(kvm->opaque, addr,
								 *(uint8_t *)p);
		break;
	  case 2:
		r = kvm->callbacks->outw(kvm->opaque, addr,
								 *(uint16_t *)p);
		break;
	  case 4:
		r = kvm->callbacks->outl(kvm->opaque, addr,
								 *(uint32_t *)p);
		break;
	  default:
		fprintf(stderr, "bad I/O size %d\n", run->io.size);
		return -EMSGSIZE;
	  }
	  break;
	default:
	  fprintf(stderr, "bad I/O direction %d\n", run->io.direction);
	  return -EPROTO;
	}

	p += run->io.size;
  }

  return 0;
}

int handle_debug(kvm_context_t kvm, int vcpu, void *env)
{
#ifdef KVM_CAP_SET_GUEST_DEBUG
  struct kvm_run *run = kvm->run[vcpu];

  return kvm->callbacks->debug(kvm->opaque, env, &run->debug.arch);
#else
  return 0;
#endif
}

int kvm_get_regs(kvm_context_t kvm, int vcpu, struct kvm_regs *regs)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_GET_REGS, regs);
}

int kvm_set_regs(kvm_context_t kvm, int vcpu, struct kvm_regs *regs)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_REGS, regs);
}

int kvm_get_fpu(kvm_context_t kvm, int vcpu, struct kvm_fpu *fpu)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_GET_FPU, fpu);
}

int kvm_set_fpu(kvm_context_t kvm, int vcpu, struct kvm_fpu *fpu)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_FPU, fpu);
}

int kvm_get_sregs(kvm_context_t kvm, int vcpu, struct kvm_sregs *sregs)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_GET_SREGS, sregs);
}

int kvm_set_sregs(kvm_context_t kvm, int vcpu, struct kvm_sregs *sregs)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_SREGS, sregs);
}

#ifdef KVM_CAP_MP_STATE
int kvm_get_mpstate(kvm_context_t kvm, int vcpu, struct kvm_mp_state *mp_state)
{
  int r;

  r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_MP_STATE);
  if (r > 0)
	return ioctl(kvm->vcpu_fd[vcpu], KVM_GET_MP_STATE, mp_state);
  return -ENOSYS;
}

int kvm_set_mpstate(kvm_context_t kvm, int vcpu, struct kvm_mp_state *mp_state)
{
  int r;

  r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_MP_STATE);
  if (r > 0)
	return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_MP_STATE, mp_state);
  return -ENOSYS;
}
#endif

static int handle_mmio(kvm_context_t kvm, struct kvm_run *kvm_run)
{
  unsigned long addr = kvm_run->mmio.phys_addr;
  void *data = kvm_run->mmio.data;

  /* hack: Red Hat 7.1 generates these weird accesses. */
  if ((addr > 0xa0000-4 && addr <= 0xa0000) && kvm_run->mmio.len == 3)
	return 0;

  if (kvm_run->mmio.is_write)
	return kvm->callbacks->mmio_write(kvm->opaque, addr, data,
									  kvm_run->mmio.len);
  else
	return kvm->callbacks->mmio_read(kvm->opaque, addr, data,
									 kvm_run->mmio.len);
}

int handle_io_window(kvm_context_t kvm)
{
  return kvm->callbacks->io_window(kvm->opaque);
}

int handle_halt(kvm_context_t kvm, int vcpu)
{
  return kvm->callbacks->halt(kvm->opaque, vcpu);
}

int handle_shutdown(kvm_context_t kvm, void *env)
{
  return kvm->callbacks->shutdown(kvm->opaque, env);
}

int try_push_interrupts(kvm_context_t kvm)
{
  return kvm->callbacks->try_push_interrupts(kvm->opaque);
}

static inline void push_nmi(kvm_context_t kvm)
{
#ifdef KVM_CAP_USER_NMI
  kvm->callbacks->push_nmi(kvm->opaque);
#endif /* KVM_CAP_USER_NMI */
}

void post_kvm_run(kvm_context_t kvm, void *env)
{
  kvm->callbacks->post_kvm_run(kvm->opaque, env);
}

int pre_kvm_run(kvm_context_t kvm, void *env)
{
  return kvm->callbacks->pre_kvm_run(kvm->opaque, env);
}

int kvm_get_interrupt_flag(kvm_context_t kvm, int vcpu)
{
  struct kvm_run *run = kvm->run[vcpu];

  return run->if_flag;
}

int kvm_is_ready_for_interrupt_injection(kvm_context_t kvm, int vcpu)
{
  struct kvm_run *run = kvm->run[vcpu];

  return run->ready_for_interrupt_injection;
}

int kvm_run(kvm_context_t kvm, int vcpu, void *env)
{
  int r;
  int fd = kvm->vcpu_fd[vcpu];
  struct kvm_run *run = kvm->run[vcpu];

 again:
  push_nmi(kvm);
#if !defined(__s390__)
  if (!kvm->irqchip_in_kernel)
	run->request_interrupt_window = try_push_interrupts(kvm);
#endif
  r = pre_kvm_run(kvm, env);
  if (r)
	return r;
  r = ioctl(fd, KVM_RUN, 0);

  if (r == -1 && errno != EINTR && errno != EAGAIN) {
	r = -errno;
	post_kvm_run(kvm, env);
	fprintf(stderr, "kvm_run: %s\n", strerror(-r));
	return r;
  }

  post_kvm_run(kvm, env);

#if defined(KVM_CAP_COALESCED_MMIO)
  if (kvm->coalesced_mmio) {
	struct kvm_coalesced_mmio_ring *ring = (void *)run +
	  kvm->coalesced_mmio * PAGE_SIZE;
	while (ring->first != ring->last) {
	  kvm->callbacks->mmio_write(kvm->opaque,
								 ring->coalesced_mmio[ring->first].phys_addr,
								 &ring->coalesced_mmio[ring->first].data[0],
								 ring->coalesced_mmio[ring->first].len);
	  smp_wmb();
	  ring->first = (ring->first + 1) %
		KVM_COALESCED_MMIO_MAX;
	}
  }
#endif

#if !defined(__s390__)
  if (r == -1) {
	r = handle_io_window(kvm);
	goto more;
  }
#endif
  if (1) {
	switch (run->exit_reason) {
	case KVM_EXIT_UNKNOWN:
	  fprintf(stderr, "unhandled vm exit: 0x%x vcpu_id %d\n",
			  (unsigned)run->hw.hardware_exit_reason, vcpu);
	  kvm_show_regs(kvm, vcpu);
	  abort();
	  break;
	case KVM_EXIT_FAIL_ENTRY:
	  fprintf(stderr, "kvm_run: failed entry, reason %u\n", 
			  (unsigned)run->fail_entry.hardware_entry_failure_reason & 0xffff);
	  kvm_show_regs(kvm, vcpu);
	  return -ENOEXEC;
	  break;
	case KVM_EXIT_EXCEPTION:
	  fprintf(stderr, "exception %d (%x)\n", 
			  run->ex.exception,
			  run->ex.error_code);
	  kvm_show_regs(kvm, vcpu);
	  kvm_show_code(kvm, vcpu);
	  abort();
	  break;
	case KVM_EXIT_IO:
	  r = handle_io(kvm, run, vcpu);
	  break;
	case KVM_EXIT_DEBUG:
	  r = handle_debug(kvm, vcpu, env);
	  break;
	case KVM_EXIT_MMIO:
	  r = handle_mmio(kvm, run);
	  break;
	case KVM_EXIT_HLT:
	  r = handle_halt(kvm, vcpu);
	  break;
	case KVM_EXIT_IRQ_WINDOW_OPEN:
	  break;
	case KVM_EXIT_SHUTDOWN:
	  r = handle_shutdown(kvm, env);
	  break;
#if defined(__s390__)
	case KVM_EXIT_S390_SIEIC:
	  r = kvm->callbacks->s390_handle_intercept(kvm, vcpu,
												run);
	  break;
	case KVM_EXIT_S390_RESET:
	  r = kvm->callbacks->s390_handle_reset(kvm, vcpu, run);
	  break;
#endif
	default:
	  if (kvm_arch_run(run, kvm, vcpu)) {
		fprintf(stderr, "unhandled vm exit: 0x%x\n",
				run->exit_reason);
		kvm_show_regs(kvm, vcpu);
		abort();
	  }
	  break;
	}
  }
 more:
  if (!r)
	goto again;
  return r;
}

int kvm_inject_irq(kvm_context_t kvm, int vcpu, unsigned irq)
{
  struct kvm_interrupt intr;

  intr.irq = irq;
  return ioctl(kvm->vcpu_fd[vcpu], KVM_INTERRUPT, &intr);
}

#ifdef KVM_CAP_SET_GUEST_DEBUG
int kvm_set_guest_debug(kvm_context_t kvm, int vcpu, struct kvm_guest_debug *dbg)
{
  return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_GUEST_DEBUG, dbg);
}
#endif

int kvm_set_signal_mask(kvm_context_t kvm, int vcpu, const sigset_t *sigset)
{
  struct kvm_signal_mask *sigmask;
  int r;

  if (!sigset) {
	r = ioctl(kvm->vcpu_fd[vcpu], KVM_SET_SIGNAL_MASK, NULL);
	if (r == -1)
	  r = -errno;
	return r;
  }
  sigmask = malloc(sizeof(*sigmask) + sizeof(*sigset));
  if (!sigmask)
	return -ENOMEM;

  sigmask->len = 8;
  memcpy(sigmask->sigset, sigset, sizeof(*sigset));
  r = ioctl(kvm->vcpu_fd[vcpu], KVM_SET_SIGNAL_MASK, sigmask);
  if (r == -1)
	r = -errno;
  free(sigmask);
  return r;
}

int kvm_irqchip_in_kernel(kvm_context_t kvm)
{
  return kvm->irqchip_in_kernel;
}

int kvm_pit_in_kernel(kvm_context_t kvm)
{
  return kvm->pit_in_kernel;
}

int kvm_has_sync_mmu(kvm_context_t kvm)
{
  int r = 0;
#ifdef KVM_CAP_SYNC_MMU
  r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_SYNC_MMU);
#endif
  return r;
}

int kvm_inject_nmi(kvm_context_t kvm, int vcpu)
{
#ifdef KVM_CAP_USER_NMI
  return ioctl(kvm->vcpu_fd[vcpu], KVM_NMI);
#else
  return -ENOSYS;
#endif
}

int kvm_init_coalesced_mmio(kvm_context_t kvm)
{
  int r = 0;
  kvm->coalesced_mmio = 0;
#ifdef KVM_CAP_COALESCED_MMIO
  r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_COALESCED_MMIO);
  if (r > 0) {
	kvm->coalesced_mmio = r;
	return 0;
  }
#endif
  return r;
}

int kvm_register_coalesced_mmio(kvm_context_t kvm, uint64_t addr, uint32_t size)
{
#ifdef KVM_CAP_COALESCED_MMIO
  struct kvm_coalesced_mmio_zone zone;
  int r;

  if (kvm->coalesced_mmio) {

	zone.addr = addr;
	zone.size = size;

	r = ioctl(kvm->vm_fd, KVM_REGISTER_COALESCED_MMIO, &zone);
	if (r == -1) {
	  perror("kvm_register_coalesced_mmio_zone");
	  return -errno;
	}
	return 0;
  }
#endif
  return -ENOSYS;
}

int kvm_unregister_coalesced_mmio(kvm_context_t kvm, uint64_t addr, uint32_t size)
{
#ifdef KVM_CAP_COALESCED_MMIO
  struct kvm_coalesced_mmio_zone zone;
  int r;

  if (kvm->coalesced_mmio) {

	zone.addr = addr;
	zone.size = size;

	r = ioctl(kvm->vm_fd, KVM_UNREGISTER_COALESCED_MMIO, &zone);
	if (r == -1) {
	  perror("kvm_unregister_coalesced_mmio_zone");
	  return -errno;
	}
	DPRINTF("Unregistered coalesced mmio region for %llx (%lx)\n", addr, size);
	return 0;
  }
#endif
  return -ENOSYS;
}

#ifdef KVM_CAP_DEVICE_ASSIGNMENT
int kvm_assign_pci_device(kvm_context_t kvm,
						  struct kvm_assigned_pci_dev *assigned_dev)
{
  int ret;

  ret = ioctl(kvm->vm_fd, KVM_ASSIGN_PCI_DEVICE, assigned_dev);
  if (ret < 0)
	return -errno;

  return ret;
}

static int kvm_old_assign_irq(kvm_context_t kvm,
							  struct kvm_assigned_irq *assigned_irq)
{
  int ret;

  ret = ioctl(kvm->vm_fd, KVM_ASSIGN_IRQ, assigned_irq);
  if (ret < 0)
	return -errno;

  return ret;
}

#ifdef KVM_CAP_ASSIGN_DEV_IRQ
int kvm_assign_irq(kvm_context_t kvm,
				   struct kvm_assigned_irq *assigned_irq)
{
  int ret;

  ret = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_ASSIGN_DEV_IRQ);
  if (ret > 0) {
	ret = ioctl(kvm->vm_fd, KVM_ASSIGN_DEV_IRQ, assigned_irq);
	if (ret < 0)
	  return -errno;
	return ret;
  }

  return kvm_old_assign_irq(kvm, assigned_irq);
}

int kvm_deassign_irq(kvm_context_t kvm,
					 struct kvm_assigned_irq *assigned_irq)
{
  int ret;

  ret = ioctl(kvm->vm_fd, KVM_DEASSIGN_DEV_IRQ, assigned_irq);
  if (ret < 0)
	return -errno;

  return ret;
}
#else
int kvm_assign_irq(kvm_context_t kvm,
				   struct kvm_assigned_irq *assigned_irq)
{
  return kvm_old_assign_irq(kvm, assigned_irq);
}
#endif
#endif

#ifdef KVM_CAP_DEVICE_DEASSIGNMENT
int kvm_deassign_pci_device(kvm_context_t kvm,
							struct kvm_assigned_pci_dev *assigned_dev)
{
  int ret;

  ret = ioctl(kvm->vm_fd, KVM_DEASSIGN_PCI_DEVICE, assigned_dev);
  if (ret < 0)
	return -errno;

  return ret;
}
#endif

int kvm_destroy_memory_region_works(kvm_context_t kvm)
{
  int ret = 0;

#ifdef KVM_CAP_DESTROY_MEMORY_REGION_WORKS
  ret = ioctl(kvm->fd, KVM_CHECK_EXTENSION,
			  KVM_CAP_DESTROY_MEMORY_REGION_WORKS);
  if (ret <= 0)
	ret = 0;
#endif
  return ret;
}

int kvm_reinject_control(kvm_context_t kvm, int pit_reinject)
{
#ifdef KVM_CAP_REINJECT_CONTROL
  int r;
  struct kvm_reinject_control control;

  control.pit_reinject = pit_reinject;

  r = ioctl(kvm->fd, KVM_CHECK_EXTENSION, KVM_CAP_REINJECT_CONTROL);
  if (r > 0) {
	r = ioctl(kvm->vm_fd, KVM_REINJECT_CONTROL, &control);
	if (r == -1)
	  return -errno;
	return r;
  }
#endif
  return -ENOSYS;
}

int kvm_has_gsi_routing(kvm_context_t kvm)
{
  int r = 0;

#ifdef KVM_CAP_IRQ_ROUTING
  r = kvm_check_extension(kvm, KVM_CAP_IRQ_ROUTING);
#endif
  return r;
}

int kvm_get_gsi_count(kvm_context_t kvm)
{
#ifdef KVM_CAP_IRQ_ROUTING
  return kvm_check_extension(kvm, KVM_CAP_IRQ_ROUTING);
#else
  return -EINVAL;
#endif
}

int kvm_clear_gsi_routes(kvm_context_t kvm)
{
#ifdef KVM_CAP_IRQ_ROUTING
  kvm->irq_routes->nr = 0;
  return 0;
#else
  return -EINVAL;
#endif
}

int kvm_add_routing_entry(kvm_context_t kvm,
						  struct kvm_irq_routing_entry* entry)
{
#ifdef KVM_CAP_IRQ_ROUTING
  struct kvm_irq_routing *z;
  struct kvm_irq_routing_entry *new;
  int n, size;

  if (kvm->irq_routes->nr == kvm->nr_allocated_irq_routes) {
	n = kvm->nr_allocated_irq_routes * 2;
	if (n < 64)
	  n = 64;
	size = sizeof(struct kvm_irq_routing);
	size += n * sizeof(*new);
	z = realloc(kvm->irq_routes, size);
	if (!z)
	  return -ENOMEM;
	kvm->nr_allocated_irq_routes = n;
	kvm->irq_routes = z;
  }
  n = kvm->irq_routes->nr++;
  new = &kvm->irq_routes->entries[n];
  memset(new, 0, sizeof(*new));
  new->gsi = entry->gsi;
  new->type = entry->type;
  new->flags = entry->flags;
  new->u = entry->u;

  if (entry->gsi > kvm->max_used_gsi)
	kvm->max_used_gsi = entry->gsi;
  return 0;
#else
  return -ENOSYS;
#endif
}

int kvm_add_irq_route(kvm_context_t kvm, int gsi, int irqchip, int pin)
{
#ifdef KVM_CAP_IRQ_ROUTING
  struct kvm_irq_routing_entry e;

  e.gsi = gsi;
  e.type = KVM_IRQ_ROUTING_IRQCHIP;
  e.flags = 0;
  e.u.irqchip.irqchip = irqchip;
  e.u.irqchip.pin = pin;
  return kvm_add_routing_entry(kvm, &e);
#else
  return -ENOSYS;
#endif
}

int kvm_del_routing_entry(kvm_context_t kvm,
						  struct kvm_irq_routing_entry* entry)
{
#ifdef KVM_CAP_IRQ_ROUTING
  struct kvm_irq_routing_entry *e, *p;
  int i, found = 0;

  for (i = 0; i < kvm->irq_routes->nr; ++i) {
	e = &kvm->irq_routes->entries[i];
	if (e->type == entry->type
		&& e->gsi == entry->gsi) {
	  switch (e->type)
		{
		case KVM_IRQ_ROUTING_IRQCHIP: {
		  if (e->u.irqchip.irqchip ==
			  entry->u.irqchip.irqchip
			  && e->u.irqchip.pin ==
			  entry->u.irqchip.pin) {
			p = &kvm->irq_routes->
			  entries[--kvm->irq_routes->nr];
			*e = *p;
			found = 1;
		  }
		  break;
		}
		case KVM_IRQ_ROUTING_MSI: {
		  if (e->u.msi.address_lo ==
			  entry->u.msi.address_lo
			  && e->u.msi.address_hi ==
			  entry->u.msi.address_hi
			  && e->u.msi.data == entry->u.msi.data) {
			p = &kvm->irq_routes->
			  entries[--kvm->irq_routes->nr];
			*e = *p;
			found = 1;
		  }
		  break;
		}
		default:
		  break;
		}
	  if (found)
		return 0;
	}
  }
  return -ESRCH;
#else
  return -ENOSYS;
#endif
}

int kvm_del_irq_route(kvm_context_t kvm, int gsi, int irqchip, int pin)
{
#ifdef KVM_CAP_IRQ_ROUTING
  struct kvm_irq_routing_entry e;

  e.gsi = gsi;
  e.type = KVM_IRQ_ROUTING_IRQCHIP;
  e.flags = 0;
  e.u.irqchip.irqchip = irqchip;
  e.u.irqchip.pin = pin;
  return kvm_del_routing_entry(kvm, &e);
#else
  return -ENOSYS;
#endif
}

int kvm_commit_irq_routes(kvm_context_t kvm)
{
#ifdef KVM_CAP_IRQ_ROUTING
  int r;

  kvm->irq_routes->flags = 0;
  r = ioctl(kvm->vm_fd, KVM_SET_GSI_ROUTING, kvm->irq_routes);
  if (r == -1)
	r = -errno;
  return r;
#else
  return -ENOSYS;
#endif
}

int kvm_get_irq_route_gsi(kvm_context_t kvm)
{
#ifdef KVM_CAP_IRQ_ROUTING
  if (kvm->max_used_gsi >= KVM_IOAPIC_NUM_PINS)  {
	if (kvm->max_used_gsi <= kvm_get_gsi_count(kvm))
	  return kvm->max_used_gsi + 1;
	else
	  return -ENOSPC;
  } else
	return KVM_IOAPIC_NUM_PINS;
#else
  return -ENOSYS;
#endif
}

#ifdef KVM_CAP_DEVICE_MSIX
int kvm_assign_set_msix_nr(kvm_context_t kvm,
                           struct kvm_assigned_msix_nr *msix_nr)
{
  int ret;

  ret = ioctl(kvm->vm_fd, KVM_ASSIGN_SET_MSIX_NR, msix_nr);
  if (ret < 0)
	return -errno;

  return ret;
}

int kvm_assign_set_msix_entry(kvm_context_t kvm,
                              struct kvm_assigned_msix_entry *entry)
{
  int ret;

  ret = ioctl(kvm->vm_fd, KVM_ASSIGN_SET_MSIX_ENTRY, entry);
  if (ret < 0)
	return -errno;

  return ret;
}
#endif
