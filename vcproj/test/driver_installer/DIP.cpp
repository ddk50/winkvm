// DIP.cpp : コンソール アプリケーションのエントリ ポイントを定義します。
//

#include "stdafx.h"

#define MAX_PATH_SIZE           (1024)
//#define ESM_POKECODEANDLOOKUP	(WM_USER + 101)

DWORD PopMsg(DWORD ret, LPCTSTR pszFormat, ...);
BOOL InstallDriver(const PTCHAR szDriverPath);
BOOL StartDriver(IN LPCTSTR szDriverName);
BOOL UnInstallDriver(IN LPCTSTR szDriver);
BOOL CreateDriver(IN LPCTSTR szDriverName,
				  IN LPCTSTR szDriverFullPath);

int main(int argc, char* argv[])
{
	int ch;
	BOOL ret = false;

	while ((ch = getopt(argc, argv, ":e:i:")) != -1) {
		switch (ch) {
			case 'i':
				fprintf(stdout, "install driver %s\n", optarg);
				ret = InstallDriver((PTCHAR)optarg);
				break;
			case 'e':
				fprintf(stdout, "uninstall driver %s\n", optarg);
				ret = UnInstallDriver((PTCHAR)optarg);
				break;
			case ':':
				fprintf(stdout, "%c needs filename\n", ch);
				break;
			case '?':				
				break;
			default:
				fprintf(stdout, "usage:\n");
				break;
		}
	}

	if (ret) {
		fprintf(stdout, "success!\n");
		exit(EXIT_SUCCESS);
	} 

	exit(EXIT_FAILURE);

	return 0;
}

BOOL InstallDriver(const PTCHAR szDriverPath)
{
	//ドライバ名取得
	TCHAR *ptr = (TCHAR*)wcsrchr(szDriverPath, _T('\\'));
	if(ptr == NULL) {
		fprintf(stderr, "Illegal driver file path\");
		return false;
	}
	
	TCHAR szDriverName[MAX_PATH_SIZE];
	lstrcpy(szDriverName, ptr + 1);

	// 拡張子を省く
	ptr = wcsrchr(szDriverName, _T('.'));
	if (ptr != NULL) {
		*ptr = _T('\0');
	}

	// ドライバを生成
	if (CreateDriver(szDriverName, szDriverPath)) {
//		PopMsg(TRUE, _T("CreateDriver関数が失敗しました"));
		return false;
	}

	// ドライバサービス開始
	if(StartDriver(szDriverName)) {
		PopMsg(-1, _T("StartDriver関数は失敗しました"));
		return false;
	}

	return true;
}

BOOL CreateDriver(IN LPCTSTR szDriverName,
				  IN LPCTSTR szDriverFullPath)
{
	// サービスコントロールマネージャーを開く
	SC_HANDLE hSCManager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
	if(hSCManager == NULL) {
		return false;
	}

	// ドライバサービスを開く
	SC_HANDLE hDriver = OpenService(hSCManager, szDriverName, SERVICE_ALL_ACCESS);

	// もし開けないならば新しくドライバサービスを生成
	if (hDriver == NULL) {
		hDriver = CreateService(hSCManager, szDriverName, szDriverName, SERVICE_ALL_ACCESS,
			                    SERVICE_KERNEL_DRIVER, SERVICE_AUTO_START, SERVICE_ERROR_NORMAL,
								szDriverFullPath, NULL, NULL, NULL, NULL, NULL);
		if (hDriver == NULL) {
			CloseServiceHandle(hSCManager);
			return true;
		}
		CloseServiceHandle(hDriver);
		CloseServiceHandle(hSCManager);
		return false;
	}
	
	// もし開けるならばドライバサービスをストップ
	BOOL bResult = false;

	try {
		SERVICE_STATUS ss;
		if(!ControlService(hDriver, SERVICE_CONTROL_INTERROGATE, &ss)) {
			return false;
		}

		if (ss.dwCurrentState == SERVICE_STOPPED) {
			return false;
		}
		
		if(!ControlService(hDriver, SERVICE_CONTROL_STOP, &ss)) {
			throw 1;
		}

		// ストップ処理を1秒ごとに10回繰り返す
		BOOL bStopped = FALSE;
		for (int i = 0; i < 10; i++) {
			Sleep(1000);
			if(ControlService(hDriver, SERVICE_CONTROL_INTERROGATE, &ss) == 0 || 
				ss.dwCurrentState == SERVICE_STOPPED) {
				bStopped = true;
				break;
			}
		}

		if(bStopped == false) {
			throw 2;
		}

	} catch(int err) {
		PopMsg(0, _T("Error: %d"), err);
		bResult = true;
	}

	CloseServiceHandle(hDriver);
	CloseServiceHandle(hSCManager);

	return bResult;
}

BOOL StartDriver(IN LPCTSTR szDriverName)
{
	// サービスコントロールマネージャーを開く
	SC_HANDLE hSCManager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
	if(hSCManager == NULL) {
		return TRUE;
	}

	// サービス制御マネージャのデータベースハンドルを開く
	SC_HANDLE hDriver = OpenService(hSCManager, szDriverName, SERVICE_ALL_ACCESS);
	if (hDriver == NULL) {
		CloseServiceHandle(hSCManager);
		return TRUE;
	}

	BOOL bResult = FALSE;

	try{
		// サービスが自らの現在のステータス情報をサービスマネージャに伝えて、
		// 情報を更新するよう要求する。
		SERVICE_STATUS ss;
		if(ControlService(hDriver, SERVICE_CONTROL_INTERROGATE, &ss)){
			if(ss.dwCurrentState == SERVICE_RUNNING)
				return FALSE;
		}
		else if(GetLastError() != ERROR_SERVICE_NOT_ACTIVE)
			throw 2;

		// サービスを開始する
		if(!StartService(hDriver, 0, NULL))
			throw 3;

		// Give it 10 seconds to start
		BOOL bStarted = FALSE;
		for(int i = 0; i < 10; i++){
			Sleep(1000);
			if(ControlService(
				hDriver, SERVICE_CONTROL_INTERROGATE, &ss) &&
				ss.dwCurrentState == SERVICE_RUNNING)
			{
				bStarted = TRUE;
				break;
			}
		}
		if(!bStarted)
			throw 4;
	}catch(int err){
		PopMsg(0, _T("Error: %d"), err);
		bResult = TRUE;
	}

	CloseServiceHandle(hDriver);
	CloseServiceHandle(hSCManager);
	return bResult;
}

BOOL UnInstallDriver(IN LPCTSTR szDriver)
{
	// ドライバ名取得
	TCHAR szDriverName[MAX_PATH_SIZE];
	lstrcpy(szDriverName, szDriver);
	TCHAR *ptr = (TCHAR*)wcsrchr(szDriver, _T('\\'));
	if (ptr != NULL) {
		lstrcpy(szDriverName, ptr + 1);
	}

	// 拡張子を省く
	ptr = (TCHAR*)wcsrchr(szDriverName, _T('.'));
	if (ptr != NULL) {
		*ptr = _T('\0');
	}

	// サービスコントロールマネージャーを開く
	SC_HANDLE hSCManager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
	
	// ドライバサービスを開く
	SC_HANDLE hDriver = OpenService(hSCManager, szDriverName, SERVICE_ALL_ACCESS);
	if (hDriver == NULL) {
		return TRUE;
	}

	// 停止要求
	SERVICE_STATUS  ss;
	ControlService(hDriver, SERVICE_CONTROL_STOP, &ss);

	// サービス制御マネージャのデータベースから削除
	DeleteService(hDriver);

	// オブジェクトハンドルを閉じる
    CloseServiceHandle(hDriver);
	CloseServiceHandle(hSCManager);
	return FALSE;
}

// printfに似た実装のメッセージボックス
DWORD PopMsg(DWORD ret, LPCTSTR pszFormat, ...)
{
	TCHAR    sz[1024];
	va_list  argList;

	va_start(argList, pszFormat);
	_vswprintf(sz, pszFormat, argList);
	va_end(argList);
	printf((char*)sz);

	return ret;
}