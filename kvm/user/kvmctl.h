/** \file kvmctl.h
 * libkvm API
 */

#ifndef KVMCTL_H
#define KVMCTL_H

#define __user /* temporary, until installed via make headers_install */
#include <linux/kvm.h>
#include <stdint.h>

struct kvm_context;

typedef struct kvm_context *kvm_context_t;

/*!
 * \brief KVM callbacks structure
 *
 * This structure holds pointers to various functions that KVM will call
 * when it encounters something that cannot be virtualized, such as
 * accessing hardware devices via MMIO or regular IO.
 */
struct kvm_callbacks {
    int (*cpuid)(void *opaque, 
		  uint64_t *rax, uint64_t *rbx, uint64_t *rcx, uint64_t *rdx);
	/// For 8bit IO reads from the guest (Usually when executing 'inb')
    int (*inb)(void *opaque, uint16_t addr, uint8_t *data);
	/// For 16bit IO reads from the guest (Usually when executing 'inw')
    int (*inw)(void *opaque, uint16_t addr, uint16_t *data);
	/// For 32bit IO reads from the guest (Usually when executing 'inl')
    int (*inl)(void *opaque, uint16_t addr, uint32_t *data);
	/// For 8bit IO writes from the guest (Usually when executing 'outb')
    int (*outb)(void *opaque, uint16_t addr, uint8_t data);
	/// For 16bit IO writes from the guest (Usually when executing 'outw')
    int (*outw)(void *opaque, uint16_t addr, uint16_t data);
	/// For 32bit IO writes from the guest (Usually when executing 'outl')
    int (*outl)(void *opaque, uint16_t addr, uint32_t data);
	/// For 8bit memory reads from unmapped memory (For MMIO devices)
    int (*readb)(void *opaque, uint64_t addr, uint8_t *data);
	/// For 16bit memory reads from unmapped memory (For MMIO devices)
    int (*readw)(void *opaque, uint64_t addr, uint16_t *data);
	/// For 32bit memory reads from unmapped memory (For MMIO devices)
    int (*readl)(void *opaque, uint64_t addr, uint32_t *data);
	/// For 64bit memory reads from unmapped memory (For MMIO devices)
    int (*readq)(void *opaque, uint64_t addr, uint64_t *data);
	/// For 8bit memory writes to unmapped memory (For MMIO devices)
    int (*writeb)(void *opaque, uint64_t addr, uint8_t data);
	/// For 16bit memory writes to unmapped memory (For MMIO devices)
    int (*writew)(void *opaque, uint64_t addr, uint16_t data);
	/// For 32bit memory writes to unmapped memory (For MMIO devices)
    int (*writel)(void *opaque, uint64_t addr, uint32_t data);
	/// For 64bit memory writes to unmapped memory (For MMIO devices)
    int (*writeq)(void *opaque, uint64_t addr, uint64_t data);
    int (*debug)(void *opaque, int vcpu);
	/*!
	 * \brief Called when the VCPU issues an 'hlt' instruction.
	 *
	 * Typically, you should yeild here to prevent 100% CPU utilization
	 * on the host CPU.
	 */
    int (*halt)(void *opaque, int vcpu);
    int (*shutdown)(void *opaque, int vcpu);
    int (*io_window)(void *opaque);
    int (*try_push_interrupts)(void *opaque);
    void (*post_kvm_run)(void *opaque, struct kvm_run *kvm_run);
    void (*pre_kvm_run)(void *opaque, struct kvm_run *kvm_run);
};

/*!
 * \brief Create new KVM context
 *
 * This creates a new kvm_context. A KVM context is a small area of data that
 * holds information about the KVM instance that gets created by this call.\n
 * This should always be your first call to KVM.
 *
 * \param callbacks Pointer to a valid kvm_callbacks structure
 * \param opaque Not used
 * \return NULL on failure
 */
kvm_context_t kvm_init(struct kvm_callbacks *callbacks,
		       void *opaque);

/*!
 * \brief Cleanup the KVM context
 *
 * Should always be called when closing down KVM.\n
 * Exception: If kvm_init() fails, this function should not be called, as the
 * context would be invalid
 *
 * \param kvm Pointer to the kvm_context that is to be freed
 */
void kvm_finalize(kvm_context_t kvm);

/*!
 * \brief Create new virtual machine
 *
 * This creates a new virtual machine, maps physical RAM to it, and creates a
 * virtual CPU for it.\n
 * \n
 * Memory gets mapped for addresses 0->0xA0000, 0xC0000->phys_mem_bytes
 *
 * \param kvm Pointer to the current kvm_context
 * \param phys_mem_bytes The amount of physical ram you want the VM to have
 * \param phys_mem This pointer will be set to point to the memory that
 * kvm_create allocates for physical RAM
 * \return 0 on success
 */
int kvm_create(kvm_context_t kvm,
	       unsigned long phys_mem_bytes,
	       void **phys_mem);

/*!
 * \brief Start the VCPU
 *
 * This starts the VCPU and virtualization is started.\n
 * \n
 * This function will not return until any of these conditions are met:
 * - An IO/MMIO handler does not return "0"
 * - An exception that neither the guest OS, nor KVM can handle occurs
 *
 * \note This function will call the callbacks registered in kvm_init()
 * to emulate those functions
 * \note If you at any point want to interrupt the VCPU, kvm_run() will
 * listen to the EINTR signal. This allows you to simulate external interrupts
 * and asyncronous IO.
 *
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should be started
 * \return 0 on success, but you really shouldn't expect this function to
 * return except for when an error has occured, or when you have sent it
 * an EINTR signal.
 */
int kvm_run(kvm_context_t kvm, int vcpu);

/*!
 * \brief Read VCPU registers
 *
 * This gets the GP registers from the VCPU and outputs them
 * into a kvm_regs structure
 *
 * \note This function returns a \b copy of the VCPUs registers.\n
 * If you wish to modify the VCPUs GP registers, you should call kvm_set_regs()
 *
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \param regs Pointer to a kvm_regs which will be populated with the VCPUs
 * registers values
 * \return 0 on success
 */
int kvm_get_regs(kvm_context_t kvm, int vcpu, struct kvm_regs *regs);

/*!
 * \brief Write VCPU registers
 *
 * This sets the GP registers on the VCPU from a kvm_regs structure
 *
 * \note When this function returns, the regs pointer and the data it points to
 * can be discarded
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \param regs Pointer to a kvm_regs which will be populated with the VCPUs
 * registers values
 * \return 0 on success
 */
int kvm_set_regs(kvm_context_t kvm, int vcpu, struct kvm_regs *regs);

/*!
 * \brief Read VCPU system registers
 *
 * This gets the non-GP registers from the VCPU and outputs them
 * into a kvm_sregs structure
 *
 * \note This function returns a \b copy of the VCPUs registers.\n
 * If you wish to modify the VCPUs non-GP registers, you should call
 * kvm_set_sregs()
 *
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \param regs Pointer to a kvm_sregs which will be populated with the VCPUs
 * registers values
 * \return 0 on success
 */
int kvm_get_sregs(kvm_context_t kvm, int vcpu, struct kvm_sregs *regs);

/*!
 * \brief Write VCPU system registers
 *
 * This sets the non-GP registers on the VCPU from a kvm_sregs structure
 *
 * \note When this function returns, the regs pointer and the data it points to
 * can be discarded
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \param regs Pointer to a kvm_sregs which will be populated with the VCPUs
 * registers values
 * \return 0 on success
 */
int kvm_set_sregs(kvm_context_t kvm, int vcpu, struct kvm_sregs *regs);

struct kvm_msr_list *kvm_get_msr_list(kvm_context_t);
int kvm_get_msrs(kvm_context_t, int vcpu, struct kvm_msr_entry *msrs, int n);
int kvm_set_msrs(kvm_context_t, int vcpu, struct kvm_msr_entry *msrs, int n);

/*!
 * \brief Simulate an external vectored interrupt
 *
 * This allows you to simulate an external vectored interrupt.
 *
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \param irq Vector number
 * \return 0 on success
 */
int kvm_inject_irq(kvm_context_t kvm, int vcpu, unsigned irq);
int kvm_guest_debug(kvm_context_t, int vcpu, struct kvm_debug_guest *dbg);

/*!
 * \brief Dump all VCPU information
 *
 * This dumps \b all the information that KVM has about a virtual CPU, namely:
 * - GP Registers
 * - System registers (selectors, descriptors, etc)
 * - VMCS Data
 * - MSRS
 * - Pending interrupts
 *
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \return 0 on success
 */
int kvm_dump_vcpu(kvm_context_t kvm, int vcpu);

/*!
 * \brief Dump VCPU registers
 *
 * This dumps some of the information that KVM has about a virtual CPU, namely:
 * - GP Registers
 *
 * A much more verbose version of this is available as kvm_dump_vcpu()
 *
 * \param kvm Pointer to the current kvm_context
 * \param vcpu Which virtual CPU should get dumped
 * \return 0 on success
 */
void kvm_show_regs(kvm_context_t kvm, int vcpu);

void *kvm_create_phys_mem(kvm_context_t, unsigned long phys_start, 
			  unsigned long len, int slot, int log, int writable);
void kvm_destroy_phys_mem(kvm_context_t, unsigned long phys_start, 
			  unsigned long len);
int kvm_get_dirty_pages(kvm_context_t, int slot, void *buf);

/*!
 * \brief get a bitmap of guest ram pages which are allocated to the guest.
 *
 * \param kvm Pointer to the current kvm_context
 * \param slot Memory slot number
 * \param bitmap Long aligned address of a big enough bitmap (one bit per page)
 */
int kvm_get_mem_map(kvm_context_t kvm, int slot, void *bitmap);

/*!
 * \brief Enable dirty-pages-logging for all memory regions
 *
 * \param kvm Pointer to the current kvm_context
 */
int kvm_dirty_pages_log_enable_all(kvm_context_t kvm);

/*!
 * \brief Disable dirty-page-logging for some memory regions
 *
 * Disable dirty-pages-logging for those memory regions that were
 * created with dirty-page-logging disabled.
 *
 * \param kvm Pointer to the current kvm_context
 */
int kvm_dirty_pages_log_reset(kvm_context_t kvm);

#endif
