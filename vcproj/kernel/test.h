
#ifndef _TEST_H_
#define _TEST_H_

/* test */
void _cdecl test_size(int pvoid_size,
					  int LIST_ENTRY_size);
void _cdecl test_call(char *from_func, int a, int b, int c);
void _cdecl test_nullcheck(void *null_val1);

void do_check(void);

#endif
