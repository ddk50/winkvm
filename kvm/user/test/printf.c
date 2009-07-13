#include "printf.h"
#include <stdarg.h>

void print(const char *s);

typedef struct pstream {
    char *buffer;
    int remain;
    int added;
} pstream_t;

static void addchar(pstream_t *p, char c)
{
    if (p->remain) {
	*p->buffer++ = c;
	--p->remain;
    }
    ++p->added;
}

void print_str(pstream_t *p, const char *s)
{
    while (*s)
	addchar(p, *s++);
}

static char digits[16] = "0123456789abcdef";

void print_int(pstream_t *ps, long n, int base)
{
    char buf[sizeof(long) * 3 + 2], *p = buf;
    int s = 0, i;
    
    if (n < 0) {
	n = -n;
	s = 1;
    }

    while (n) {
	*p++ = digits[n % base];
	n /= base;
    }
    
    if (s)
	*p++ = '-';

    if (p == buf)
	*p++ = '0';
    
    for (i = 0; i < (p - buf) / 2; ++i) {
	char tmp;

	tmp = buf[i];
	buf[i] = p[-1-i];
	p[-1-i] = tmp;
    }

    *p = 0;

    print_str(ps, buf);
}

void print_unsigned(pstream_t *ps, unsigned long n, int base)
{
    char buf[sizeof(long) * 3 + 1], *p = buf;
    int i;
    
    while (n) {
	*p++ = digits[n % base];
	n /= base;
    }
    
    if (p == buf)
	*p++ = '0';
    
    for (i = 0; i < (p - buf) / 2; ++i) {
	char tmp;

	tmp = buf[i];
	buf[i] = p[-1-i];
	p[-1-i] = tmp;
    }

    *p = 0;

    print_str(ps, buf);
}

int vsnprintf(char *buf, int size, const char *fmt, va_list va)
{
    int n;
    pstream_t s;

    s.buffer = buf;
    s.remain = size - 1;
    s.added = 0;
    while (*fmt) {
	char f = *fmt++;

	if (f != '%') {
	    addchar(&s, f);
	    continue;
	}
	f = *fmt++;
	switch (f) {
	case '%':
	    addchar(&s, '%');
	    break;
	case '\0':
	    --fmt;
	    break;
	case 'd':
	    print_int(&s, va_arg(va, int), 10);
	    break;
	case 'x':
	    print_unsigned(&s, va_arg(va, int), 16);
	    break;
	case 'p':
	    print_str(&s, "0x");
	    print_unsigned(&s, (unsigned long)va_arg(va, void *), 16);
	    break;
	case 's':
	    print_str(&s, va_arg(va, const char *));
	    break;
	default:
	    addchar(&s, f);
	    break;
	}
    }
    *s.buffer = 0;
    ++s.added;
    return s.added;
}


int snprintf(char *buf, int size, const char *fmt, ...)
{
    va_list va;
    int r;

    va_start(va, fmt);
    r = vsnprintf(buf, size, fmt, va);
    va_end(va);
    return r;
}

int printf(const char *fmt, ...)
{
    va_list va;
    char buf[2000];
    int r;

    va_start(va, fmt);
    r = vsnprintf(buf, sizeof buf, fmt, va);
    va_end(va);
    print(buf);
    return r;
}
