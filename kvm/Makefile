
include config.mak

DESTDIR=

rpmrelease = devel

.PHONY: kernel user qemu clean

all: $(if $(WANT_MODULE), kernel) user qemu

kcmd = $(if $(WANT_MODULE),,@\#)

qemu kernel user:
	$(MAKE) -C $@

qemu: user

bindir = /usr/bin
bin = $(bindir)/kvm
initdir = /etc/init.d
confdir = /etc/kvm
utilsdir = /etc/kvm/utils

install-rpm:
	mkdir -p $(DESTDIR)/$(bindir)
	mkdir -p $(DESTDIR)/$(confdir)
	mkdir -p $(DESTDIR)/$(initdir)
	mkdir -p $(DESTDIR)/$(utilsdir)
	mkdir -p $(DESTDIR)/etc/udev/rules.d
	make -C qemu DESTDIR=$(DESTDIR)/ install
	ln -sf /usr/kvm/bin/qemu-system-x86_64 $(DESTDIR)/$(bin)
	cp scripts/kvm $(DESTDIR)/$(initdir)/kvm
	cp scripts/qemu-ifup $(DESTDIR)/$(confdir)/qemu-ifup
	install -t $(DESTDIR)/etc/udev/rules.d scripts/*kvm*.rules

install:
	$(kcmd)make -C kernel DESTDIR="$(DESTDIR)" install
	make -C user DESTDIR="$(DESTDIR)" install
	make -C qemu DESTDIR="$(DESTDIR)" install

tmpspec = .tmp.kvm.spec
RPMDIR=$$(pwd)/RPMS

rpm:	srpm
	mkdir -p $(RPMDIR)/$$(uname -i)
	rpmbuild --rebuild \
		 --define="_rpmdir $(RPMDIR)" \
		 --define="_topdir $$(pwd)" \
		SRPMS/kvm-0.0-$(rpmrelease).src.rpm

srpm:
	mkdir -p SOURCES SRPMS
	sed 's/^Release:.*/Release: $(rpmrelease)/' kvm.spec > $(tmpspec)
	tar czf SOURCES/kvm.tar.gz qemu
	tar czf SOURCES/user.tar.gz user
	tar czf SOURCES/kernel.tar.gz kernel
	tar czf SOURCES/scripts.tar.gz scripts
	cp Makefile configure SOURCES
	rpmbuild  --define="_topdir $$(pwd)" -bs $(tmpspec)
	$(RM) $(tmpspec)

clean:
	for i in $(if $(WANT_MODULE), kernel) user qemu; do \
		make -C $$i clean; \
	done
	rm -f config.mak user/config.mak
