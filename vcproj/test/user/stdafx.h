// stdafx.h : 標準のシステム インクルード ファイルのインクルード ファイル、または
// 参照回数が多く、かつあまり変更されない、プロジェクト専用のインクルード ファイル
// を記述します。
//

#pragma once

#include "targetver.h"

#define GPD_DEVICE_NAME   L"\\Device\\winkvm"
#define NT_DEVICE_NAME    GPD_DEVICE_NAME

#define DOS_DEVICE_NAME   L"\\DosDevices\\winkvm"
#define PORTIO_TAG        'TROP'

#include <stdlib.h>
#include <stdio.h>
#include <tchar.h>
#include <windows.h>
#include <winioctl.h>
#include <memory.h>

#include "../include/kvm.h"

// TODO: プログラムに必要な追加ヘッダーをここで参照してください。
