
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/compiler.h>
#include <linux/pci.h>
#include <linux/init.h>
#include <linux/ioport.h>
#include <linux/completion.h>
#include <linux/interrupt.h>
#include <asm/io.h>
#include <asm/uaccess.h>
#include <asm/irq.h>

#define HYPERCALL_DRIVER_NAME "Qumranet_hypercall_driver"
#define HYPERCALL_DRIVER_VERSION "1"
#define PCI_VENDOR_ID_HYPERCALL	0x5002
#define PCI_DEVICE_ID_HYPERCALL 0x2258

MODULE_AUTHOR ("Dor Laor <dor.laor@qumranet.com>");
MODULE_DESCRIPTION (HYPERCALL_DRIVER_NAME);
MODULE_LICENSE("GPL");
MODULE_VERSION(HYPERCALL_DRIVER_VERSION);

static int debug = 0;
module_param(debug, int, 0);
MODULE_PARM_DESC (debug, "toggle debug flag");

#define HYPERCALL_DEBUG 1
#if HYPERCALL_DEBUG
#  define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __FUNCTION__ , ## args)
#  define assert(expr) \
        if(unlikely(!(expr))) {				        \
        printk(KERN_ERR "Assertion failed! %s,%s,%s,line=%d\n",	\
        #expr,__FILE__,__FUNCTION__,__LINE__);		        \
        }
#else
#  define DPRINTK(fmt, args...)
#  define assert(expr) do {} while (0)
#endif

static struct pci_device_id hypercall_pci_tbl[] = {
	{PCI_VENDOR_ID_HYPERCALL, PCI_DEVICE_ID_HYPERCALL, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
	{0,}
};
MODULE_DEVICE_TABLE (pci, hypercall_pci_tbl);



/****** Hypercall device definitions ***************/
#include <qemu/hw/hypercall.h>

/* read PIO/MMIO register */
#define HIO_READ8(reg, ioaddr)		ioread8(ioaddr + (reg))
#define HIO_READ16(reg, ioaddr)		ioread16(ioaddr + (reg))
#define HIO_READ32(reg, ioaddr)		ioread32(ioaddr + (reg))

/* write PIO/MMIO register */
#define HIO_WRITE8(reg, val8, ioaddr)	iowrite8((val8), ioaddr + (reg))
#define HIO_WRITE16(reg, val16, ioaddr)	iowrite16((val16), ioaddr + (reg))
#define HIO_WRITE32(reg, val32, ioaddr)	iowrite32((val32), ioaddr + (reg))


struct hypercall_dev {
	struct pci_dev  *pci_dev;
	struct kobject	kobject;
	u32 		state;
	spinlock_t	lock;
	u8		name[128];
	u16		irq;
	u32		regs_len;
	void __iomem 	*io_addr;
	unsigned long	base_addr;	/* device I/O address	*/
	unsigned long 	cmd;
};


static int hypercall_close(struct hypercall_dev* dev);
static int hypercall_open(struct hypercall_dev *dev);
static void hypercall_cleanup_dev(struct hypercall_dev *dev);
static irqreturn_t hypercall_interrupt(int irq, void *dev_instance,
				       struct pt_regs *regs);

static void __exit hypercall_sysfs_remove(struct hypercall_dev *dev);
static int hypercall_sysfs_add(struct hypercall_dev *dev);


static int __devinit hypercall_init_board(struct pci_dev *pdev,
					  struct hypercall_dev **dev_out)
{
	unsigned long ioaddr;
	struct hypercall_dev *dev;
	int rc;
	u32 disable_dev_on_err = 0;
	unsigned long pio_start, pio_end, pio_flags, pio_len;
	unsigned long mmio_start, mmio_end, mmio_flags, mmio_len;

	assert(pdev != NULL);

	*dev_out = NULL;

	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
	if (dev == NULL) {
		printk (KERN_ERR "%s: Unable to alloc hypercall device\n", pci_name(pdev));
		return -ENOMEM;
	}
	dev->pci_dev = pdev;
	rc = pci_enable_device(pdev);
	if (rc)
		goto err_out;
	disable_dev_on_err = 1;

	pio_start = pci_resource_start (pdev, 0);
	pio_end = pci_resource_end (pdev, 0);
	pio_flags = pci_resource_flags (pdev, 0);
	pio_len = pci_resource_len (pdev, 0);

	mmio_start = pci_resource_start (pdev, 1);
	mmio_end = pci_resource_end (pdev, 1);
	mmio_flags = pci_resource_flags (pdev, 1);
	mmio_len = pci_resource_len (pdev, 1);

	DPRINTK("PIO region size == 0x%02lX\n", pio_len);
	DPRINTK("MMIO region size == 0x%02lX\n", mmio_len);

	rc = pci_request_regions (pdev, "hypercall");
	if (rc)
		goto err_out;

#define USE_IO_OPS 1
#ifdef USE_IO_OPS
	ioaddr = (unsigned long)pci_iomap(pdev, 0, 0);
	//ioaddr = ioport_map(pio_start, pio_len);
	if (!ioaddr) {
		printk(KERN_ERR "%s: cannot map PIO, aborting\n", pci_name(pdev));
		rc = -EIO;
		goto err_out;
	}
	dev->base_addr = (unsigned long)pio_start;
	dev->io_addr = (void*)ioaddr;
	dev->regs_len = pio_len;
#else
	ioaddr = pci_iomap(pdev, 1, 0);
	if (ioaddr == NULL) {
		printk(KERN_ERR "%s: cannot remap MMIO, aborting\n", pci_name(pdev));
		rc = -EIO;
		goto err_out;
	}
	dev->base_addr = ioaddr;
	dev->io_addr = (void*)ioaddr;
	dev->regs_len = mmio_len;
#endif /* USE_IO_OPS */

	*dev_out = dev;
	return 0;

err_out:
	hypercall_cleanup_dev(dev);
	if (disable_dev_on_err)
		pci_disable_device(pdev);
	return rc;
}

static int __devinit hypercall_init_one(struct pci_dev *pdev,
				        const struct pci_device_id *ent)
{
	struct hypercall_dev *dev;
	u8 pci_rev;

	assert(pdev != NULL);
	assert(ent != NULL);

	pci_read_config_byte(pdev, PCI_REVISION_ID, &pci_rev);

	if (pdev->vendor == PCI_VENDOR_ID_HYPERCALL &&
	    pdev->device == PCI_DEVICE_ID_HYPERCALL) {
		printk(KERN_INFO "pci dev %s (id %04x:%04x rev %02x) is a guest hypercall device\n",
		       pci_name(pdev), pdev->vendor, pdev->device, pci_rev);
	}

	if (hypercall_init_board(pdev, &dev) != 0)
		return -1;
	
	assert(dev != NULL);
                    
	dev->irq = pdev->irq;

	spin_lock_init(&dev->lock);
        pci_set_drvdata(pdev, dev);

	printk (KERN_INFO "name=%s: base_addr=0x%lx, io_addr=0x%lx, IRQ=%d\n",
		dev->name, dev->base_addr, (unsigned long)dev->io_addr, dev->irq);
	hypercall_open(dev);

	if (hypercall_sysfs_add(dev) != 0)
		return -1;

	return 0;
}

static void __devexit hypercall_remove_one(struct pci_dev *pdev)
{
	struct hypercall_dev *dev = pci_get_drvdata(pdev);

	assert(dev != NULL);

	hypercall_close(dev);
	hypercall_sysfs_remove(dev);
	hypercall_cleanup_dev(dev);
	pci_disable_device(pdev);
}

static int hypercall_tx(struct hypercall_dev *dev, unsigned char *buf, size_t len)
{
	void __iomem *ioaddr = (void __iomem*)dev->io_addr;
	int i;

	if (len > HP_MEM_SIZE)
		return -EINVAL;

	spin_lock(&dev->lock);
	HIO_WRITE8(HP_TXSIZE, len, ioaddr);
	for (i=0; i< len; i++)
		HIO_WRITE8(HP_TXBUFF, buf[i], ioaddr);
	spin_unlock(&dev->lock);

	return 0;
}

/* 
 * The interrupt handler does all of the rx  work and cleans up
 * after the tx
 */
static irqreturn_t hypercall_interrupt(int irq, void *dev_instance,
				       struct pt_regs *regs)
{
	struct hypercall_dev *dev = (struct hypercall_dev *)dev_instance;
	void __iomem *ioaddr = (void __iomem*)dev->io_addr;
	u32 status;
	int irq_handled = IRQ_NONE;
	int rx_buf_size;
	int i;
	u8 buffer[HP_MEM_SIZE];
	u8 *pbuf;

	DPRINTK("base addr is 0x%lx, io_addr=0x%lx\n", dev->base_addr, (long)dev->io_addr);
	
	spin_lock(&dev->lock);
	status = HIO_READ8(HSR_REGISTER, ioaddr);
	DPRINTK("irq status is 0x%x\n", status);

	/* shared irq? */
	if (unlikely((status & HSR_VDR) == 0)) {
		DPRINTK("not handeling irq, not ours\n");
		goto out;
	}
	
	/* Disable device interrupts */
	HIO_WRITE8(HCR_REGISTER, HCR_DI, ioaddr);
	DPRINTK("disable device interrupts\n");

	rx_buf_size = HIO_READ8(HP_RXSIZE, ioaddr);
	DPRINTK("Rx buffer size is %d\n", rx_buf_size);

	if (rx_buf_size > HP_MEM_SIZE)
		rx_buf_size = HP_MEM_SIZE;

	for (i=0, pbuf=buffer; i<rx_buf_size; i++, pbuf++) {
		*pbuf = HIO_READ8(HP_RXBUFF, ioaddr + i);
		DPRINTK("Read 0x%x as dword %d\n", *pbuf, i);
	}
	*pbuf = '\0';
	DPRINTK("Read buffer %s", (char*)buffer);

	HIO_WRITE8(HCR_REGISTER, HCR_EI, ioaddr);
	DPRINTK("Enable interrupt\n");
	irq_handled = IRQ_HANDLED;
 out:
	spin_unlock(&dev->lock);


	hypercall_tx(dev, "hello host", sizeof("hello host"));
	return irq_handled;
}


static int hypercall_open(struct hypercall_dev *dev)
{
	int rc;

	rc = request_irq(dev->irq, &hypercall_interrupt,
			 SA_SHIRQ, dev->name, dev);
	if (rc) {
		printk(KERN_ERR "%s failed to request an irq\n", __FUNCTION__);
		return rc;
	}

	//hypercall_thread_start(dev);

	return 0;
}

static int hypercall_close(struct hypercall_dev* dev)
{
	//hypercall_thread_stop(dev);
	synchronize_irq(dev->irq);
	free_irq(dev->irq, dev);

	return 0;
}

#ifdef CONFIG_PM

static int hypercall_suspend(struct pci_dev *pdev, pm_message_t state)
{
	pci_save_state(pdev);
	pci_set_power_state(pdev, PCI_D3hot);
	DPRINTK("Power mgmt suspend, set power state to PCI_D3hot\n");

	return 0;
}

static int hypercall_resume(struct pci_dev *pdev)
{
	pci_restore_state(pdev);
	pci_set_power_state(pdev, PCI_D0);
	DPRINTK("Power mgmt resume, set power state to PCI_D0\n");

	return 0;
}

#endif /* CONFIG_PM */

static void hypercall_cleanup_dev(struct hypercall_dev *dev)
{
	DPRINTK("cleaning up\n");
        pci_release_regions(dev->pci_dev);
	pci_iounmap(dev->pci_dev, (void*)dev->io_addr);
	pci_set_drvdata (dev->pci_dev, NULL);
	kfree(dev);
}

static struct pci_driver hypercall_pci_driver = {
	.name		= HYPERCALL_DRIVER_NAME,
	.id_table	= hypercall_pci_tbl,
	.probe		= hypercall_init_one,
	.remove		= __devexit_p(hypercall_remove_one),
#ifdef CONFIG_PM
	.suspend	= hypercall_suspend,
	.resume		= hypercall_resume,
#endif /* CONFIG_PM */
};

static int __init hypercall_init_module(void)
{
	printk (KERN_INFO HYPERCALL_DRIVER_NAME "\n");
	return pci_module_init(&hypercall_pci_driver);
}

static void __exit hypercall_cleanup_module(void)
{
	pci_unregister_driver(&hypercall_pci_driver);
}

/*
 * sysfs support
 */

struct hypercall_attribute {
	struct attribute attr;
	ssize_t (*show)(struct hypercall_dev*, char *buf);
	ssize_t (*store)(struct hypercall_dev*, unsigned long val);
};

static ssize_t hypercall_attribute_show(struct kobject *kobj,
		struct attribute *attr, char *buf)
{
	struct hypercall_attribute *hypercall_attr;
	struct hypercall_dev *hdev;

	hypercall_attr = container_of(attr, struct hypercall_attribute, attr);
	hdev = container_of(kobj, struct hypercall_dev, kobject);

	if (!hypercall_attr->show)
		return -EIO;

	return hypercall_attr->show(hdev, buf);
}

static ssize_t hypercall_attribute_store(struct kobject *kobj,
		struct attribute *attr, const char *buf, size_t count)
{
	struct hypercall_attribute *hypercall_attr;
	struct hypercall_dev *hdev;
	char *endp;
	unsigned long val;
	int rc;

	val = simple_strtoul(buf, &endp, 0);

	hypercall_attr = container_of(attr, struct hypercall_attribute, attr);
	hdev = container_of(kobj, struct hypercall_dev, kobject);

	if (!hypercall_attr->store)
		return -EIO;

	rc = hypercall_attr->store(hdev, val);
	if (!rc)
		rc = count;
	return rc;
}

#define MAKE_HYPERCALL_R_ATTR(_name)					\
static ssize_t _name##_show(struct hypercall_dev *hdev, char *buf)	\
{									\
	return sprintf(buf, "%lu\n", (unsigned long)hdev->_name);	\
}									\
struct hypercall_attribute hypercall_attr_##_name = __ATTR_RO(_name)

#define MAKE_HYPERCALL_WR_ATTR(_name)					\
static int _name##_store(struct hypercall_dev *hdev, unsigned long val)	\
{									\
	hdev->_name = (typeof(hdev->_name))val;				\
	return 0;							\
}									\
static ssize_t _name##_show(struct hypercall_dev *hdev, char *buf)	\
{									\
	return sprintf(buf, "%lu\n", (unsigned long)hdev->_name);	\
}									\
struct hypercall_attribute hypercall_attr_##_name = 			\
	__ATTR(_name,S_IRUGO|S_IWUGO,_name##_show,_name##_store)

MAKE_HYPERCALL_R_ATTR(base_addr);
MAKE_HYPERCALL_R_ATTR(irq);
MAKE_HYPERCALL_WR_ATTR(cmd);

#define GET_HYPERCALL_ATTR(_name)	(&hypercall_attr_##_name.attr)

static struct attribute *hypercall_default_attrs[] = {
	GET_HYPERCALL_ATTR(base_addr),
	GET_HYPERCALL_ATTR(irq),
	GET_HYPERCALL_ATTR(cmd),
	NULL
};

static struct sysfs_ops hypercall_sysfs_ops = {
	.show = hypercall_attribute_show,
	.store = hypercall_attribute_store,
};

static void hypercall_sysfs_release(struct kobject *kobj)
{
	DPRINTK(" called for obj name %s\n", kobj->name);
}

static struct kobj_type hypercall_ktype = {
	.release	= hypercall_sysfs_release,
	.sysfs_ops	= &hypercall_sysfs_ops,
	.default_attrs	= hypercall_default_attrs
};


static int hypercall_sysfs_add(struct hypercall_dev *dev)
{
	int rc;

	kobject_init(&dev->kobject);
	dev->kobject.ktype = &hypercall_ktype;
	rc = kobject_set_name(&dev->kobject, "%s", HYPERCALL_DRIVER_NAME);
	if (rc != 0) {
		printk("%s: kobject_set_name failed, err=%d\n", __FUNCTION__, rc);
		return rc;
	}

        rc = kobject_add(&dev->kobject);
	if (rc != 0) {
		printk("%s: kobject_add failed, err=%d\n", __FUNCTION__, rc);
		return rc;
	}

        rc = sysfs_create_link(&dev->pci_dev->dev.kobj, &dev->kobject,
			       HYPERCALL_DRIVER_NAME);
	if (rc != 0) {
		printk("%s: sysfs_create_link failed, err=%d\n", __FUNCTION__, rc);
		kobject_del(&dev->kobject);
	}
        
	return rc;
}

static void hypercall_sysfs_remove(struct hypercall_dev *dev)
{
	sysfs_remove_link(&dev->pci_dev->dev.kobj, HYPERCALL_DRIVER_NAME);
	kobject_del(&dev->kobject);
}

module_init(hypercall_init_module);
module_exit(hypercall_cleanup_module);
