include ../../config-host.mak
ifneq ($(VPATH),)
srcdir=$(VPATH)/kvm/libkvm
else
srcdir=.
endif

include $(srcdir)/config-$(ARCH).mak


# libkvm is not -Wredundant-decls friendly yet
CFLAGS += -Wno-redundant-decls

# cc-option
# Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
              > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)

CFLAGS += $(autodepend-flags) -g -fomit-frame-pointer -Wall
CFLAGS += $(call cc-option, -fno-stack-protector, "")
CFLAGS += $(call cc-option, -fno-stack-protector-all, "")
CFLAGS += $(KVM_CFLAGS)

LDFLAGS += $(CFLAGS)

CXXFLAGS = $(autodepend-flags)

VPATH:=$(VPATH)/kvm/libkvm

autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d


all: libkvm.a

libkvm.a: libkvm.o $(libkvm-$(ARCH)-objs)
	$(AR) rcs $@ $^

install:
	@echo skipping libkvm install

install-libkvm:
	install -D libkvm.h $(DESTDIR)/$(PREFIX)/include/libkvm.h
	install -D libkvm.a $(DESTDIR)/$(PREFIX)/$(LIBDIR)/libkvm.a

install-kernel-headers:
	install -D $(LIBKVM_KERNELDIR)/include/linux/kvm.h \
		$(DESTDIR)/$(PREFIX)/include/linux/kvm.h
	install -D $(LIBKVM_KERNELDIR)/include/linux/kvm_para.h \
		$(DESTDIR)/$(PREFIX)/include/linux/kvm_para.h

-include .*.d

clean:
	$(RM) *.o *.a .*.d
