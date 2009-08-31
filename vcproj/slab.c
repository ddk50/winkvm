
#include "init.h"

void _cdecl kfree(void *objp)
{
	if (objp == NULL) {
		return;
	} else {
		ExFreePoolWithTag(objp, 'HmmV');
	}
}

//_cdecl‚ð‚Â‚¯‚Ä’¼‚Á‚½‚©‚È???
void* _cdecl kmalloc(int size, int type)
{
	void *ret = NULL;
	switch (type) {
		default:
			ret = ExAllocatePoolWithTag(NonPagedPool, size, 'HmmV');
			break;
	}
	return ret;
}

void* _cdecl wkstab_kmalloc(int size, int type)
{
	void *ret = NULL;
	switch (type) {
		default:
			ret = ExAllocatePoolWithTag(NonPagedPool, size, 'HmmV');
			break;
	}
	return ret;
}

int _cdecl copy_from_user(void *to, const void *from, int n)
{
	return 1;
}

void _cdecl mutex_unlock(struct mutex *lock)
{

}

void _cdecl mutex_lock(struct mutex *lock)
{

}

void _cdecl dump_stack(void)
{

}

struct mm_struct {
	int test;
};

typedef struct {
	unsigned int break_lock;
	unsigned int magic, owner_cpu;
} spinlock_t;

void _cdecl do_munmap(struct mm_struct *mm, unsigned long start, size_t len)
{

}

void* _cdecl kmap_atomic(struct page *page, enum km_type type)
{
	return NULL;
}

void _cdecl kunmap_atomic(void *kvaddr, enum km_type type)
{
	return;
}

int _cdecl winkvmstab_get_nr_cpus(void)
{
	return 1;
}

unsigned long _cdecl copy_to_user(void *to, const void *from , unsigned long n)
{
	return 0;
}

/* ƒhƒ‰ƒCƒo‘¤‚Åfastcallˆµ‚¢‚É‚È‚Á‚Ä‚é‚Ì‚Å */
unsigned long _cdecl winkvm_alloc_pages(unsigned long addr, unsigned int order)
{
	return 0x0;
}

struct page* _cdecl winkvm_alloc_page(int flag)
{
	return NULL;
}


void _cdecl __winkvm_get_free_pages(unsigned long addr)
{
}

void _cdecl winkvm_free_page(unsigned long addr)
{
	return;
}

void _cdecl winkvm_free_pages(unsigned long addr, unsigned int order)
{
	return;
}

void _cdecl vfree(void *ptr)
{
	return;
}

void* _cdecl vmalloc(unsigned long size)
{
	return NULL;
}

int _cdecl winkvmstab_first_cpu(void)
{
	return 0;
}

int _cdecl winkvmstab_next_cpu(int cpu)
{
	return 1;
}

void _cdecl down_read(struct rw_semaphore *sem)
{
	return;
}

void _cdecl down_write(struct rw_semaphore *sem)
{
	return;
}

void* _cdecl page_address(struct page *page)
{
	return NULL;
}

void _cdecl up_write(struct rw_semaphore *sem)
{
	return;
}

void _cdecl up_read(struct rw_semaphore *sem)
{
	return;
}

void _cdecl enable_irq(unsigned int irq)
{

}

void _cdecl free_irq(unsigned int irq, void *dev_id)
{

}

/* spin_lock() function is expanded the folloing code */
void _cdecl _spin_lock(spinlock_t *lock)
{

}

int _cdecl down_read_trylock(struct rw_semaphore *sem)
{
	return 1;
}

void _cdecl schedule(void)
{
	return;
}

typedef struct {
	int __test;
} irq_handler_t;

int _cdecl request_irq(unsigned int irq, irq_handler_t handler,
					   unsigned long irqflags, const char *devname, void *dev_id)
{
	return 1;
}

struct file {
	int __file;
};

unsigned long _cdecl winkvm_do_mmap(struct file *file, unsigned long addr, 
									unsigned long len, unsigned long prot,
									unsigned long flag, unsigned long offset)
{
	return 0;
}

/* fake symbols */
int _cdecl cond_resched(void)
{
	return 1;
}

/* fake symbols */
int _cdecl kvm_smp_call_function_single(int cpu, void (*func)(void *info),
										void *info, int wait)
{
	return 1;
}

int _cdecl winkvm_init(void *opaque, unsigned int vcpu_size)
{
	return 1;
}

void _cdecl winkvm_exit(void)
{

}
