include ../config.mak
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
KVERREL = $(patsubst /lib/modules/%/build,%,$(KERNELDIR))

DESTDIR=

INSTALLDIR = $(patsubst %/build,%/extra,$(KERNELDIR))

all::
	$(MAKE) -C $(KERNELDIR) M=`pwd` "$$@"

install:
	mkdir -p $(DESTDIR)/$(INSTALLDIR)
	cp *.ko $(DESTDIR)/$(INSTALLDIR)
	/sbin/depmod -a

clean:
	$(MAKE) -C $(KERNELDIR) M=`pwd` $@

svnclean:
	svn st | grep '^\?' | awk '{print $2}' | xargs rm -rf
