
// winkvmuser.cpp : コンソール アプリケーションのエントリ ポイントを定義します。
//

#include <windows.h>
#include <stdio.h>

/* This Handler shows how SEH can modify global variables
   and/or registers of the faulting routine to "fix" an error
   It also shows that more than one error can be handled in a single
   exception handler */
int SEHHandler(struct _EXCEPTION_RECORD *ExceptionRecord, 
			   void *EstablisherFrame, struct _CONTEXT *ContextRecord, 
			   void *DispatcherContext)
{
	void *fault_addr;
	int ret = EXCEPTION_EXECUTE_HANDLER;

	printf("You've raised exception number #%x\n", ExceptionRecord->ExceptionCode);

	if (ExceptionRecord->ExceptionFlags & 1) {
		printf("non-continuable error\n");
		exit(1);
	}

	switch (ExceptionRecord->ExceptionCode) {
		case STATUS_INTEGER_DIVIDE_BY_ZERO:
			fault_addr = (void*)(ExceptionRecord->ExceptionInformation[1]);
			printf("Divide by zero at addr = 0x%08x\n", (unsigned long)fault_addr);
			ret = EXCEPTION_CONTINUE_SEARCH;
			break;
		case EXCEPTION_ACCESS_VIOLATION:
			fault_addr = (void*)(ExceptionRecord->ExceptionInformation[1]);
			printf("ACCESS VIOLATION at addr=0x%08x\n", fault_addr);
			ret = EXCEPTION_CONTINUE_SEARCH;
			break;
		default:
			ret = EXCEPTION_EXECUTE_HANDLER;
			break;
	}

	return ret;
}

/* install SEH handler */
#define SetSEHhandler(handler) \
	do { \
	   __asm mov eax, handler \
	   __asm push eax \
	   __asm push fs:[0] \
	   __asm mov fs:[0], esp \
	} while(0);\

/* uninstall SEH handler */
#define ResetSEHhandler() \
	do { \
	   __asm mov eax, [esp] \
	   __asm mov fs:[0], eax \
	   __asm add esp, 8 \
	} while(0);\

int main(int argc, char *argv[])
{
	int test = 0;
	int val = 1000;

	printf("Setting SEH handler\n");
	SetSEHhandler(SEHHandler);

	/* cause access violation */
//	val = val / test;
	*memspace = 0x1000;

	ResetSEHhandler();

	return 1;	
}
