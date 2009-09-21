
#include <windows.h>
#include <stdio.h>
#include <setjmp.h>

long *fault_addr;
int a;
long valid_memory_area = 10;
int *z = (int *) 0x12345678;
jmp_buf environment;
int error_val = -1;


/* This Handler shows how SEH can modify global variables
and/or registers of the faulting routine to "fix" an error
It also shows that more than one error can be handled in a single
exception handler */
int problem_fixing_seh(
struct _EXCEPTION_RECORD *ExceptionRecord,
void * EstablisherFrame,
struct _CONTEXT *ContextRecord,
void * DispatcherContext)
{
printf("You've raised exception number %#x\n", ExceptionRecord->ExceptionCode);
if (ExceptionRecord->ExceptionFlags & 1) {
printf("Non-continuable error\n");
exit(1); }

switch (ExceptionRecord->ExceptionCode) {
case STATUS_INTEGER_DIVIDE_BY_ZERO :
fault_addr = (long *) (ExceptionRecord->ExceptionInformation[1]);
printf("Divide by zero at addr=%#x\n", fault_addr);
/* fix the problem */
a = 5;
printf("But don't worry, it is fixed now\n");
return EXCEPTION_CONTINUE_SEARCH;
case EXCEPTION_ACCESS_VIOLATION :
fault_addr = (long *) (ExceptionRecord->ExceptionInformation[1]);
printf("ACCESS VIOLATION at addr=%#x\n", fault_addr);
/* Make faulting frame's EAX register point to a valid memory area */
ContextRecord->Eax = (DWORD)&valid_memory_area;
printf("But don't worry, it is fixed now\n");
return EXCEPTION_CONTINUE_SEARCH;
default:
return EXCEPTION_EXECUTE_HANDLER; }
}


/* This handler uses longjmp to go back to the "except" clause */
int problem_skipping_seh(
struct _EXCEPTION_RECORD *ExceptionRecord,
void * EstablisherFrame,
struct _CONTEXT *ContextRecord,
void * DispatcherContext)
{
printf("You've raised exception number %#x\n", ExceptionRecord->ExceptionCode);
if (ExceptionRecord->ExceptionFlags & 1) {
printf("Non-continuable error\n");
exit(1); }
if (ExceptionRecord->ExceptionCode != EXCEPTION_ACCESS_VIOLATION)
return EXCEPTION_EXECUTE_HANDLER;

fault_addr = (long *) (ExceptionRecord->ExceptionInformation[1]);
printf("ACCESS VIOLATION at addr=%#x\n", fault_addr);
longjmp(environment, error_val);
}

main(int argc, char *argv[])
{
DWORD handler;
int error_code;
setbuf(stdout, NULL);

printf("Loading the error fixing seh\n");

/* Simple structured exception catcher */
handler = (DWORD) problem_fixing_seh ;
asm("movl %0, %%eax\n\t"
"pushl %%eax": : "r" (handler): "%eax" );
asm("pushl %fs:0");
asm("movl %esp, %fs:0");
/* We have installed our handler */

/* Now generate a divide by zero exception */
/* The handler will replace a with the value 5
and then re-execute the offending division */
a = 0;
valid_memory_area = 10 / a;

printf("valid_memory_area = %d\n", valid_memory_area);

/* Now an invalid memory access exception */
/* The assembler code attempts to store a value (12)
in location 0h . Upon detecting the exception
the handler changes EAX to point to valid_memory_area */
asm("movl $0, %%eax\n\t"
"movl $12, (%%eax)"
: : : "%eax", "memory" );

printf("valid_memory_area = %d\n", valid_memory_area);

/* Now uninstall this seh */
asm("movl (%%esp), %%eax \n\t"
"movl %%eax, %%fs:0"
: : : "%eax");
asm("addl $8, %esp");
/* handler is uninstalled */

printf("Error fixing handler removed\n");

/* Now install a different handler that skips offending code */
handler = (DWORD) problem_skipping_seh ;
asm("movl %0, %%eax\n\t"
"pushl %%eax": : "r" (handler): "%eax" );
asm("pushl %fs:0");
asm("movl %esp, %fs:0");
/* We have installed our handler */
printf("Problem skipping SEH installed\n");

/* The longjmp call in the handler will return here,
placing a non-zero return value in setjmp */
error_code = setjmp(environment);
if (error_code != 0)
{
printf ("Skipping invalid memory access\n");
goto NoCanDo;
}
z = 0;
printf("Trying to write to memory location 0\n");
*z = 12;

NoCanDo:
/* Uninstall the seh */
asm("movl (%%esp), %%eax \n\t"
"movl %%eax, %%fs:0"
: : : "%eax");
asm("addl $8, %esp");

printf("FINISHED\n");
}
