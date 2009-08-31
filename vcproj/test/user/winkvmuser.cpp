// winkvmuser.cpp : コンソール アプリケーションのエントリ ポイントを定義します。
//

#include "stdafx.h"

#define GPD_TYPE 40000

#define XENCALL_LOGGING_START \
    CTL_CODE(GPD_TYPE,  0x900, METHOD_BUFFERED, FILE_WRITE_ACCESS)

#define XENCALL_LOGGING_STOP \
    CTL_CODE(GPD_TYPE,  0x901, METHOD_BUFFERED, FILE_WRITE_ACCESS)

#define XENCALL_WRITE_STRING \
    CTL_CODE(GPD_TYPE,  0x902, METHOD_BUFFERED, FILE_WRITE_ACCESS)

static int driver_open_test(const char *devname);

#define CHECK(checktitle, condition)\
	if ((condition)) {              \
	   fprintf(stdout, "%s ... OK\n", #checktitle);\
	} else {                                       \
	   fprintf(stdout, "%s ... FAILED %s:%d\n", #checktitle, __FILE__, __LINE__);\
	}

int main(int argc, char* argv[])
{
	driver_open_test(argv[1]);
	return 0;
}

struct ioctl_query_s {
	int code;
	unsigned long a[10];
};

static int 
send_str(HANDLE hHnd, const char *in, char *out, int outbufsize)
{
	BOOL ret = false;
	ULONG bytesReturn = 0;

	ret = DeviceIoControl(hHnd,
		                  (DWORD)XENCALL_WRITE_STRING,
						  &in,
						  strlen(in)+1,
						  &out,
						  outbufsize,
						  &bytesReturn,
						  NULL);
	if (!ret) {
		fprintf(stderr, "ioctl err: %d", GetLastError());
		return -1;
	}

	return (int)bytesReturn;
}

static int driver_open_test(const char *devname)
{
	int ret = -1;
	int i;
	ioctl_query_s query;
	DWORD dwLen, dwRet;
	HANDLE hFile;
	BYTE *pcbData;

	query.code = 10;
	for (i = 0 ; i < 10 ; i++) {
		query.a[i] = i;
	}

	fprintf(stdout, "Check device: %s\n", devname);

	hFile = CreateFile(_T("\\\\.\\winkvmtest"),
		GENERIC_READ | GENERIC_WRITE,
		FILE_SHARE_WRITE,
		NULL,
		CREATE_ALWAYS,
		FILE_ATTRIBUTE_NORMAL,
		NULL);

	CHECK("CreateFile check", hFile != INVALID_HANDLE_VALUE);

	dwLen = 100;
	pcbData = NULL;
	pcbData = (BYTE*)malloc(dwLen);
	if (pcbData == NULL) {
		fprintf(stderr, "Could not allocate memory space\n");
		return ret;
	}

	memset(pcbData, 0, dwLen);
	dwRet = 0;

	BOOL ioctl_ret;
	ioctl_ret = send_str(hFile, "hello world", (char*)pcbData, dwLen);

//	for (i = 0 ; i < 10 ; i++) {
//
//		ioctl_ret = DeviceIoControl(hFile, i, &query, 
//			sizeof(ioctl_query_s), pcbData, dwLen, &dwRet, NULL);
//
//		CHECK(DeviceIoControl, ioctl_ret);
//		Sleep(1000);

//	}

	CloseHandle(hFile);

	return ret;
}
