include ../config.mak

KVERREL = $(patsubst /lib/modules/%/build,%,$(KERNELDIR))

DESTDIR=

INSTALLDIR = $(patsubst %/build,%/extra,$(KERNELDIR))

rpmrelease = devel

LINUX = ../../../../linux

EXTRA_CFLAGS +=

all:: sync
	$(MAKE) CC="gcc -D__WINKVM__ -save-temps" -C $(KERNELDIR) V=1 M=`pwd` "$$@"

sync:
##	rsync --exclude='*.mod.c' "$(LINUX)"/drivers/kvm/*.[ch] .
	rsync "$(LINUX)"/include/linux/kvm.h \
          "$(LINUX)"/include/linux/kvm_para.h \
	      include/linux
	rsync "$(LINUX)"/include/asm/winkvmmisc.h \
          "$(LINUX)"/include/asm/msr-index.h \
          "$(LINUX)"/include/asm/processor-flags.h \
          "$(LINUX)"/include/asm/segment_32.h \
          "$(LINUX)"/include/asm/errno.h \
          "$(LINUX)"/include/asm/winkvm86.h \
           ../../windows-linux-compat/asm
	rsync "$(LINUX)"/include/asm-generic/errno.h \
           ../../windows-linux-compat/asm-generic
	rsync "$(LINUX)"/include/linux/winwdm.h \
          "$(LINUX)"/include/linux/winkvmint.h \
          "$(LINUX)"/include/linux/winkvmlist.h \
          "$(LINUX)"/include/linux/winkvmstab.h \
          "$(LINUX)"/include/linux/winkvmtypes.h \
          "$(LINUX)"/include/linux/winkvmgfp.h \
          ../../windows-linux-compat/linux
	rsync "$(LINUX)"/include/linux/winkvmint.h \
		  "$(LINUX)"/include/linux/winkvmgfp.h \
		  "$(LINUX)"/include/linux/winkvm.h \
          ../../vcproj/include/linux
# 	sed -i 's/f_path\./f_/' kvm_main.c
# 	sed -i 's/f_mnt/f_vfsmnt/' kvm_main.c
# 	mv kvm_main.c kvm_main.c.orig
# 	awk '/^static int kvmfs_get_sb/ \
# 		 { print "#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,16)\n"; \
# 		   hacking_get_sb = 1 \
# 		 } \
# 	     { print } \
# 	     /\}/ && hacking_get_sb { print "\n#endif"; hacking_get_sb = 0 } \
# 	     ' kvm_main.c.orig > kvm_main.c
# 	rm kvm_main.c.orig

cpobjs:
	for nm in *.o; do `cp $$nm $${nm%.o}.obj`; done
	mv *.obj ../../vcproj/kvmobjs/

install:
	mkdir -p $(DESTDIR)/$(INSTALLDIR)
	cp *.ko $(DESTDIR)/$(INSTALLDIR)
	/sbin/depmod -a

tmpspec = .tmp.kvm-kmod.spec
RPMDIR = $$(pwd)/../RPMS
rpm:	all
	mkdir -p ../BUILD $(RPMDIR)/$$(uname -m)
	sed 's/^Release:.*/Release: $(rpmrelease)/' kvm-kmod.spec > $(tmpspec)
	rpmbuild --define="kverrel $(KVERREL)" \
		 --define="objdir $$(pwd)" \
		 --define="_rpmdir $(RPMDIR)" \
		 --define="_topdir $$(pwd)/.." \
		-bb $(tmpspec)

clean:
	$(MAKE) -C $(KERNELDIR) M=`pwd` $@

svnclean:
	svn st | grep '^\?' | awk '{print $2}' | xargs rm -rf

