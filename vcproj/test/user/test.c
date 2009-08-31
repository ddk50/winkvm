
#include <stdlib.h>
#include <stdlib.h>
#include <string.h>
#include <error.h>
#include <inttypes.h>
#include <windows.h>

struct slot_info {
  unsigned long phys_addr;
  unsigned long len;
  unsigned long userspace_addr;
  unsigned flags;
  int logging_count;
};

struct slot_info slots[KVM_MAX_NUM_MEM_REGIONS];

kvm_context_t kvm_init(struct kvm_callbacks *callbacks,
					   void *opaque)  
{
  int fd;
  kvm_context_t kvm;
  int r;  
  
  //  fd = open("/dev/kvm", O_RDWR);
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

