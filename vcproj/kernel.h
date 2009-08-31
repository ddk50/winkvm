
#ifndef _KERNEL_H_
#define _KERNEL_H_

#define KERN_EMERG      "<0>"   /* system is unusable                   */
#define KERN_ALERT      "<1>"   /* action must be taken immediately     */
#define KERN_CRIT       "<2>"   /* critical conditions                  */
#define KERN_ERR        "<3>"   /* error conditions                     */
#define KERN_WARNING    "<4>"   /* warning conditions                   */
#define KERN_NOTICE     "<5>"   /* normal but significant condition     */
#define KERN_INFO       "<6>"   /* informational                        */
#define KERN_DEBUG      "<7>"   /* debug-level messages                 */

int _cdecl printk(const char *s, ...);
void _cdecl get_page(struct page *page);

#pragma pack(push,1)

struct inode {
	int test;
};

struct file {
	int fd;
	int f_flags;
};

struct page {
    void *private;
    unsigned long index;
    unsigned long mapping;
    int test;
};

struct file_operations {
    struct module *owner;
/*  loff_t (*llseek) (struct file *, loff_t, int); */
/*  ssize_t (*read) (struct file *, char __user *, size_t, loff_t *); */
/*  ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *); */
/*  ssize_t (*aio_read) (struct kiocb *, const struct iovec *, unsigned long, loff_t); */
/*  ssize_t (*aio_write) (struct kiocb *, const struct iovec *, unsigned long, loff_t); */
/*  int (*readdir) (struct file *, void *, filldir_t); */
/*  unsigned int (*poll) (struct file *, struct poll_table_struct *); */
    int (_cdecl *ioctl) (struct inode *, struct file *, unsigned int, unsigned long);
/*  long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long); */
/*  long (*compat_ioctl) (struct file *, unsigned int, unsigned long); */
    int (_cdecl *mmap) (struct file *, struct vm_area_struct *);
    int (_cdecl *open) (struct inode *, struct file *);
/*  int (*flush) (struct file *, fl_owner_t id); */
    int (_cdecl *release) (struct inode *, struct file *);
/*  int (*fsync) (struct file *, struct dentry *, int datasync); */
/*  int (*aio_fsync) (struct kiocb *, int datasync); */
/*  int (*fasync) (int, struct file *, int); */
/*  int (*lock) (struct file *, int, struct file_lock *); */
/*  ssize_t (*sendpage) (struct file *, struct page *, int, size_t, loff_t *, int); */
/*  unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long); */
/*  int (*check_flags)(int); */
/*  int (*dir_notify)(struct file *filp, unsigned long arg); */
/*  int (*flock) (struct file *, int, struct file_lock *); */
/*  ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int); */
/*  ssize_t (*splice_read)(struct file *, loff_t *, struct pipe_inode_info *, size_t, unsigned int); */
/*  int (*setlease)(struct file *, long, struct file_lock **); */
/*  int (*fgetattr)(struct file *, struct kstat *); */
/*  int (*fsetattr)(struct file *, struct iattr *); */
};

/* for x86_32 */
typedef struct {
    unsigned long pgprot;
} pgprot_t;

struct vm_area_struct {
    unsigned long vm_pgoff;
    unsigned long vm_start;
    unsigned long vm_end;
    pgprot_t vm_page_prot;
    int vm_flags;
    void *vm_ops;
};

//#pragma pack(pop)

void* _cdecl __va(unsigned long addr);
unsigned long _cdecl __pa(unsigned long virt);
void* _cdecl virt_to_page(void *phys);
int _cdecl pfn_valid(unsigned long pfn);

struct page* _cdecl pfn_to_page(unsigned long pfn);
unsigned long _cdecl page_to_pfn(struct page *page);

int _cdecl remap_pfn_range(struct vm_area_struct*, unsigned long addr,
						   unsigned long pfn, unsigned long size, pgprot_t prot);

#endif
