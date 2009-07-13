
include config.mak

CFLAGS = -I $(KERNELDIR)/include $(autodepend-flags) -g -fomit-frame-pointer \
	-Wall
CXXFLAGS = $(autodepend-flags) 

autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d

DESTDIR = 

ifeq ($(shell uname -m), x86_64)
LIBDIR = /lib64
else
LIBDIR = /lib
endif

all: kvmctl libkvm.a

kvmctl: kvmctl.o main.o

libkvm.a: kvmctl.o
	$(AR) rcs $@ $^

flatfiles: test/simple.flat test/stringio.flat test/memtest1.flat \
	test/irq.flat test/sieve.flat test/bootstrap \
	test/access.flat

install:
	install -D kvmctl.h $(DESTDIR)/$(PREFIX)/include/kvmctl.h
	install -D $(KERNELDIR)/include/linux/kvm.h \
		$(DESTDIR)/$(PREFIX)/include/linux/kvm.h
	install -D libkvm.a $(DESTDIR)/$(PREFIX)/$(LIBDIR)/libkvm.a

%.flat: %.o
	gcc -nostdlib -o $@ -Wl,-T,flat.lds $^

test/bootstrap: test/bootstrap.o
	gcc -nostdlib -o $@ -Wl,-T,bootstrap.lds $^

%.o: %.S
	gcc -c -nostdlib -o $@ $^

test/irq.flat: test/print.o

test/access.flat: test/cstart64.o test/access.o test/printf.o test/print.o

test/sieve.flat: test/cstart64.o test/sieve.o test/print.o test/vm.o

test/test32.flat: test/test32.o

test/%.o: CFLAGS += -std=gnu99 -ffreestanding

-include .*.d

clean:
	$(RM) kvmctl *.o *.a .*.d
	$(RM) test/bootstrap test/*.o test/*.flat test/.*.d
