#ifndef QEMU_KVM_H
#define QEMU_KVM_H

#include "kvmctl.h"

int kvm_qemu_init(void);
int kvm_qemu_create_context(void);
void kvm_qemu_destroy(void);
void kvm_load_registers(CPUState *env);
void kvm_save_registers(CPUState *env);
int kvm_cpu_exec(CPUState *env);
int kvm_update_debugger(CPUState *env);

int kvm_physical_memory_set_dirty_tracking(int enable);
int kvm_update_dirty_pages_log(void);
int kvm_get_phys_ram_page_bitmap(unsigned char *bitmap);

#define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
#define BITMAP_SIZE(m) (ALIGN(((m)>>TARGET_PAGE_BITS), HOST_LONG_BITS) / 8)
#endif
