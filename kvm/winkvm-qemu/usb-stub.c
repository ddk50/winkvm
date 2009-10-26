#include "qemu-common.h"
#include "hw/usb.h"
#include "console.h"

void usb_host_info(void)
{
    term_printf("USB host devices not supported\n");
}

USBDevice *usb_host_device_open(const char *devname)
{
    return NULL;
}
