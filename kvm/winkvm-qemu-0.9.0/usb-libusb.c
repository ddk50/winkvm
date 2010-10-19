/*
 * Generic libusb host USB redirector
 *
 * Copyright (c) 2006 Lonnie Mendez
 *      Code adapted from and modified from usb-linux.c
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
#if 0

#include "vl.h"
#include "qemu-kvm"

#include <usb.h>
#if !defined(ETIMEDOUT) && defined(_WIN32)
#define ETIMEDOUT 116
#endif


typedef int USBScanFunc(void *opaque, int bus_num, int addr, int class_id,
                        int vendor_id, int product_id, 
                        const char *product_name, int speed);
static int usb_host_find_device(int *pbus_num, int *paddr, 
                                const char *devname, struct usb_device **device);

//#define DEBUG
/* should be adjustable for interrupt endpoints */
#define TRANS_TIMEOUT 50

typedef struct USBHostDevice {
    USBDevice dev;
    int num_interfaces;
    struct usb_dev_handle *udev;
} USBHostDevice;

static void usb_host_handle_reset(USBDevice *dev)
{   
#ifdef DEBUG
    printf("usb_host_handle_reset called\n");
#endif

#if 0
    USBHostDevice *s = (USBHostDevice *)dev;
    /* USBDEVFS_RESET, but not the first time as it has already be
       * done by the host OS - usb_reset() - must reopen handle
       */
    usb_reset(s->udev);
#endif
} 

static int usb_host_handle_control(USBDevice *dev,
                                   int request,
                                   int value,
                                   int index,
                                   int length,
                                   uint8_t *data)
{
    USBHostDevice *s = (USBHostDevice *)dev;
    int ret;

    if (request == (DeviceOutRequest | USB_REQ_SET_ADDRESS)) {
        /* specific SET_ADDRESS support */
        dev->addr = value;
        return 0;
    } else {
        ret = usb_control_msg(s->udev, request >> 8, request & 0xff, value, index,
                              data, length, TRANS_TIMEOUT);
        if (ret < 0) {
#ifdef DEBUG
            printf("handle_control: ret is %d - %s\n", ret, usb_strerror());
#endif
            // TODO: figure out how usb_clear_halt()/etc fit in for different host OS
            switch(ret) {
            case -ETIMEDOUT:
                return USB_RET_NAK;
            case -EIO:
            default:
                return USB_RET_STALL;
            }
        } else {
            return ret;
        }
   }
}

static int usb_host_handle_data(USBDevice *dev, int pid, 
                                uint8_t devep,
                                uint8_t *data, int len)
{
    USBHostDevice *s = (USBHostDevice *)dev;
    int ret = 0;
#ifdef DEBUG
    int i;
#endif

    /* XXX: optimize and handle all data types by looking at the
       config descriptor */
    if (pid == USB_TOKEN_IN)
        devep |= 0x80;

#ifdef DEBUG
    if (pid != USB_TOKEN_IN) {
        printf("writing(%d bytes - to ep %x):\n", len, devep);
        for (i = 0; i < len; i++)
            printf("%x ", data[i]);
        printf("\n");
    }
#endif

    /* most libusb backends channel interrupt packets to a bulk transfer
      * handler, with the exception of bsd.c */
    switch(pid) {
        case USB_TOKEN_IN:
            ret = usb_bulk_read(s->udev, devep, data, len, TRANS_TIMEOUT);
            break;
        case USB_TOKEN_OUT:
            ret = usb_bulk_write(s->udev, devep, data, len, TRANS_TIMEOUT);
            break;
    }
    
#ifdef DEBUG
    if (pid == USB_TOKEN_IN) {
        printf("reading(%d bytes - from ep %x):\n", ret, devep);
        for (i = 0; i < ret; i++)
            printf("%x ", data[i]);
        printf("\n");
    }
#endif

    if (ret < 0) {
#ifdef DEBUG
        printf("handle_data: ret is %d - %s\n", ret, usb_strerror());
#endif
        // TODO: figure out how usb_clear_halt()/etc fit in for different host OS
        switch(ret) {
        case -ETIMEDOUT:
            return USB_RET_NAK;
        case -EIO: /* stall condition on win32 - same for mac os x? */
            usb_clear_halt(s->udev, devep);
        case -EPIPE:
        default:
            return USB_RET_STALL;
        }
    } else {
        return ret;
    }
}

static void usb_host_handle_destroy(USBDevice *dev)
{
    USBHostDevice *s = (USBHostDevice *)dev;
    int i;

    if (!s)
        return;

    for (i = 0; i < s->num_interfaces; i++)
        usb_release_interface(s->udev, i);
    usb_close(s->udev);
    s->udev = NULL;
    qemu_free(s);
}

/* XXX: exclude high speed devices or implement EHCI */
USBDevice *usb_host_device_open(const char *devname)
{
    USBHostDevice *dev;
    struct usb_dev_handle *udev = NULL;
    struct usb_device *device = NULL;
    struct usb_config_descriptor config_desc;
    int config_descr_len, nb_interfaces;
    int bus_num, addr, interface, ret;
    char product_name[32] ;
    
    if ((ret = usb_host_find_device(&bus_num, &addr, devname, &device)) < 0) 
        return NULL;

    if (!device)
        return NULL;
    
    udev = usb_open(device);

    if (!udev) {
#ifdef DEBUG
        printf("couldn't open usb device at %d.%d\n", bus_num, addr);
#endif
        return NULL;
    }
    
    /* read the 1st config descriptor */
    config_descr_len = usb_get_descriptor(udev, 2, 0, &config_desc, sizeof(config_desc));
    if (config_descr_len <= 0) {
        printf("read config_desc: %s", usb_strerror());
        goto fail;
    }
    
    if (config_descr_len > sizeof(config_desc)) {
        printf("config_desc size mismatch\n");
        goto fail;
    }
        
    nb_interfaces = config_desc.bNumInterfaces;
    usb_set_configuration(udev, config_desc.bConfigurationValue);
    
    for (interface = 0; interface < nb_interfaces; interface++) {
        /* might as well */
#ifdef LIBUSB_HAS_DETACH_KERNEL_DRIVER_NP
        usb_detach_kernel_driver_np(udev, interface);
#endif
    
        ret = usb_claim_interface(udev, interface);
    
        if (ret < 0) {
            printf("usb_claim_interface: %s", usb_strerror());
        fail:
            if (udev)
                usb_close(udev);
            return NULL;
        }
    }

#ifdef DEBUG
    printf("host USB device %d.%d grabbed\n", bus_num, addr);
#endif

    dev = qemu_mallocz(sizeof(USBHostDevice));
    if (!dev)
        goto fail;
    
    /* not accurate - might be better off reporting only low/full */
    switch (device->descriptor.bcdUSB) {
        case 0x0110:
            dev->dev.speed = USB_SPEED_FULL;
            break;
        case 0x0200:
            dev->dev.speed = USB_SPEED_HIGH;
            break;
        case 0x0100:
            dev->dev.speed = USB_SPEED_LOW;
            break;
        default:
            dev->dev.speed = USB_SPEED_FULL;
    }
    
    dev->udev = udev;
    dev->num_interfaces = nb_interfaces;
    dev->dev.handle_packet = usb_generic_handle_packet;

    dev->dev.handle_reset = usb_host_handle_reset;
    dev->dev.handle_control = usb_host_handle_control;
    dev->dev.handle_data = usb_host_handle_data;
    dev->dev.handle_destroy = usb_host_handle_destroy;
    
    /* get product string if available */
    usb_get_string_simple(udev, device->descriptor.iProduct,
                                   product_name, sizeof(product_name));
    
    if (product_name[0] == '\0')
        snprintf(dev->dev.devname, sizeof(dev->dev.devname),
                   "host:%s", devname);
    else
        pstrcpy(dev->dev.devname, sizeof(dev->dev.devname),
                   product_name);
    
    return (USBDevice *)dev;
}

static int usb_host_scan(void *opaque, struct usb_device **device,
                         USBScanFunc *func)
{
    struct usb_bus *busses, *bus;
    struct usb_dev_handle *udev;
    struct usb_device *dev;
    uint16_t vendor_id, product_id, class_id, speed;
    char product_name[256];
    int ret = 0;

#ifdef DEBUG
    usb_set_debug(255);
#else
    usb_set_debug(0);
#endif
    
    usb_init();
    usb_find_busses();
    usb_find_devices();

    busses = usb_get_busses();

    for (bus = busses; bus; bus = bus->next) {
        for (dev = bus->devices; dev; dev = dev->next) {
            vendor_id = dev->descriptor.idVendor;
            product_id = dev->descriptor.idProduct;

            /* only find devices - not root hubs */
            if (vendor_id == 0x0000 && product_id == 0x0000)
                continue;

            udev = usb_open(dev);
            if (!udev)
                continue;

            class_id = dev->descriptor.bDeviceClass;
            
            /* not accurate - might be better off reporting only low/full */
            switch (dev->descriptor.bcdUSB) {
                case 0x0110:
                    speed = USB_SPEED_FULL;
                    break;
                case 0x0200:
                    speed = USB_SPEED_HIGH;
                    break;
                case 0x0100:
                    speed = USB_SPEED_LOW;
                    break;
                default:
                    speed = USB_SPEED_FULL;
            }

            ret = usb_get_string_simple(udev, dev->descriptor.iProduct,
                                        product_name, sizeof(product_name));
            if (ret < 0)
                product_name[0] = '\0';

            ret = func(opaque, bus->location, dev->devnum, class_id, vendor_id,
                       product_id, product_name, speed);

            usb_close(udev);

            if (ret) {
                *device = dev;
                goto the_end;
            }
        }
    }

the_end:
    return ret;

}

typedef struct FindDeviceState {
    int vendor_id;
    int product_id;
    int bus_num;
    int addr;
} FindDeviceState;

static int usb_host_find_device_scan(void *opaque, int bus_num, int addr, 
                                     int class_id,
                                     int vendor_id, int product_id, 
                                     const char *product_name, int speed)
{
    FindDeviceState *s = opaque;
    if (s->vendor_id == -1 &&
        s->product_id == -1 &&
        bus_num == s->bus_num &&
        addr == s->addr) {
        s->vendor_id = vendor_id;
        s->product_id = product_id;
        return 1;
    } else if (vendor_id == s->vendor_id &&
        product_id == s->product_id) {
        s->bus_num = bus_num;
        s->addr = addr;
        return 1;
    } else {
        return 0;
    }
}

/* the syntax is : 
   'bus.addr' (decimal numbers) or 
   'vendor_id:product_id' (hexa numbers) */
static int usb_host_find_device(int *pbus_num, int *paddr, 
                                const char *devname, struct usb_device **device)
{
    const char *p;
    int ret;
    FindDeviceState fs;

    p = strchr(devname, '.');
    if (p) {
        fs.vendor_id = -1;
        fs.product_id = -1;
        fs.bus_num = strtoul(devname, NULL, 0);
        fs.addr = strtoul(p + 1, NULL, 0);
        ret = usb_host_scan(&fs, device, usb_host_find_device_scan);
        if (ret) {
            *pbus_num = fs.bus_num;
            *paddr = fs.addr;
            return 0;
        }
    }
    p = strchr(devname, ':');
    if (p) {
        fs.vendor_id = strtoul(devname, NULL, 16);
        fs.product_id = strtoul(p + 1, NULL, 16);
        ret = usb_host_scan(&fs, device, usb_host_find_device_scan);
        if (ret) {
            *pbus_num = fs.bus_num;
            *paddr = fs.addr;
            return 0;
        }
    }
    return -1;
}

/**********************/
/* USB host device info */

struct usb_class_info {
    int class;
    const char *class_name;
};

static const struct usb_class_info usb_class_info[] = {
    { USB_CLASS_AUDIO, "Audio"},
    { USB_CLASS_COMM, "Communication"},
    { USB_CLASS_HID, "HID"},
    { USB_CLASS_HUB, "Hub" },
    { USB_CLASS_PHYSICAL, "Physical" },
    { USB_CLASS_PRINTER, "Printer" },
    { USB_CLASS_MASS_STORAGE, "Storage" },
    { USB_CLASS_CDC_DATA, "Data" },
    { USB_CLASS_APP_SPEC, "Application Specific" },
    { USB_CLASS_VENDOR_SPEC, "Vendor Specific" },
    { USB_CLASS_STILL_IMAGE, "Still Image" },
    { USB_CLASS_CSCID, 	"Smart Card" },
    { USB_CLASS_CONTENT_SEC, "Content Security" },
    { -1, NULL }
};

static const char *usb_class_str(uint8_t class)
{
    const struct usb_class_info *p;
    for(p = usb_class_info; p->class != -1; p++) {
        if (p->class == class)
            break;
    }
    return p->class_name;
}

void usb_info_device(int bus_num, int addr, int class_id,
                     int vendor_id, int product_id, 
                     const char *product_name,
                     int speed)
{
    const char *class_str, *speed_str;

    switch(speed) {
    case USB_SPEED_LOW: 
        speed_str = "1.5"; 
        break;
    case USB_SPEED_FULL: 
        speed_str = "12"; 
        break;
    case USB_SPEED_HIGH: 
        speed_str = "480"; 
        break;
    default:
        speed_str = "?"; 
        break;
    }

    term_printf("  Device %d.%d, speed %s Mb/s\n", 
                bus_num, addr, speed_str);
    class_str = usb_class_str(class_id);
    if (class_str) 
        term_printf("    %s:", class_str);
    else
        term_printf("    Class %02x:", class_id);
    term_printf(" USB device %04x:%04x", vendor_id, product_id);
    if (product_name[0] != '\0')
        term_printf(", %s", product_name);
    term_printf("\n");
}

static int usb_host_info_device(void *opaque, int bus_num, int addr, 
                                int class_id,
                                int vendor_id, int product_id, 
                                const char *product_name,
                                int speed)
{
    usb_info_device(bus_num, addr, class_id, vendor_id, product_id,
                    product_name, speed);
    return 0;
}

void usb_host_info(void)
{
    usb_host_scan(NULL, NULL, usb_host_info_device);
}

#endif
