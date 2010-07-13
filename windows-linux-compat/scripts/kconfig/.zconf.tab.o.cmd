cmd_scripts/kconfig/zconf.tab.o := gcc -Wp,-MD,scripts/kconfig/.zconf.tab.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer   -DCURSES_LOC="<ncurses.h>" -DLOCALE  -Iscripts/kconfig -c -o scripts/kconfig/zconf.tab.o scripts/kconfig/zconf.tab.c

deps_scripts/kconfig/zconf.tab.o := \
  scripts/kconfig/zconf.tab.c \
  /usr/include/ctype.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/lib/gcc/i486-linux-gnu/4.2.4/include/stdarg.h \
  /usr/include/stdio.h \
  /usr/lib/gcc/i486-linux-gnu/4.2.4/include/stddef.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /usr/include/stdlib.h \
  /usr/include/sys/types.h \
  /usr/include/time.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h \
  /usr/include/string.h \
  /usr/include/bits/string.h \
  /usr/include/bits/string2.h \
  /usr/lib/gcc/i486-linux-gnu/4.2.4/include/stdbool.h \
  scripts/kconfig/lkc.h \
    $(wildcard include/config/list.h) \
  scripts/kconfig/expr.h \
  /usr/include/libintl.h \
  /usr/include/locale.h \
  /usr/include/bits/locale.h \
  scripts/kconfig/lkc_proto.h \
  scripts/kconfig/zconf.hash.c \
  scripts/kconfig/lex.zconf.c \
  /usr/include/errno.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h \
  /usr/lib/gcc/i486-linux-gnu/4.2.4/include/limits.h \
  /usr/lib/gcc/i486-linux-gnu/4.2.4/include/syslimits.h \
  /usr/include/limits.h \
  /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  scripts/kconfig/util.c \
  scripts/kconfig/confdata.c \
    $(wildcard include/config/config.h) \
    $(wildcard include/config/.h) \
    $(wildcard include/config/overwriteconfig.h) \
    $(wildcard include/config/notimestamp.h) \
    $(wildcard include/config/autoconfig.h) \
    $(wildcard include/config/autoheader.h) \
  /usr/include/sys/stat.h \
  /usr/include/bits/stat.h \
  /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h \
  scripts/kconfig/expr.c \
  scripts/kconfig/symbol.c \
  /usr/include/regex.h \
  /usr/include/sys/utsname.h \
  /usr/include/bits/utsname.h \
  scripts/kconfig/menu.c \

scripts/kconfig/zconf.tab.o: $(deps_scripts/kconfig/zconf.tab.o)

$(deps_scripts/kconfig/zconf.tab.o):
