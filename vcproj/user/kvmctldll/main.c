
/* main.c */
#include <windows.h>
#include <tchar.h>

/* グローバル変数 */
static HINSTANCE g_hInst;

/* メイン関数 */
BOOL WINAPI 
DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	switch( fdwReason ) {
	case DLL_PROCESS_ATTACH:  // ロードされた
		// どこで使うのであれば、インスタンスハンドルをグローバル変数に保存しておく
		g_hInst = hinstDLL;
		break;

	case DLL_PROCESS_DETACH:  // アンロードされた
		// 保存しておいたインスタンスハンドルを削除
		g_hInst = NULL;
		break;

	case DLL_THREAD_ATTACH:   // スレッドを作成した
		break;

	case DLL_THREAD_DETACH:   // スレッドが終了した
		break;
	}
	return TRUE;
}

__declspec(dllexport) void __cdecl test(const char *str)
{
	MessageBoxA(NULL, str, "message", MB_OK);
}

