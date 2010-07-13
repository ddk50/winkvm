
#include <linux/winkvm.h>

#define WAIT_TIME 0

struct task_struct current_task = {
	{0},
};

/* this value is refered from vmx.c */
struct task_struct *current = &current_task;

int __cdecl signal_pending(struct task_struct *p)
{
	if (p->counter++ > WAIT_TIME) {
		p->counter = 0;
		return 1;
	} else {
		return 0;
	}
}
