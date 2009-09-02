#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <windowsx.h>
#include <stdio.h>
#include <stdlib.h>
#include <process.h>

#include "../../api/inc/fmod.h"

#include "sdriver.h"
#include "resource.h"

#ifdef _WIN64
INT_PTR CALLBACK SoundDriverDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);
#else
BOOL CALLBACK SoundDriverDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);
#endif

WNDPROC oldcomboproc;
HWND	DeviceComboHwnd;

extern int         setting_buffersize;
extern int         setting_prebuffer_percent;
extern int         setting_rebuffer_percent;
extern char        setting_http_proxy[2048];
extern char        setting_cdletter[4];
extern signed char setting_cdda;
extern signed char setting_jitter;
extern signed char setting_forceaspi;
extern char        cddevice;


/*
	Function to call to create dialog box 
*/
char SoundDriver_Init(long *freq)
{
	HWND		hwnd = GetForegroundWindow();
#ifdef _WIN64
	HINSTANCE	hinst = (HINSTANCE)GetWindowLong(hwnd,GWLP_HINSTANCE);
#else
	HINSTANCE	hinst = (HINSTANCE)GetWindowLong(hwnd,GWL_HINSTANCE);
#endif

	return (char)DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_DSENUMBOX), hwnd, SoundDriverDlgProc, (LPARAM)freq);
}


/*
	SubClassed windowproc for the 'select output' combobox
*/
long CALLBACK ComboWindowProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam) 
{
	switch (message)
	{
		case WM_COMMAND:
		{
			int count;

			if (ComboBox_GetCurSel(hwnd) == 0) 
				FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
			else if (ComboBox_GetCurSel(hwnd) == 1) 
				FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
			else
				FSOUND_SetOutput(FSOUND_OUTPUT_ASIO);

			SendMessage(DeviceComboHwnd, CB_RESETCONTENT, 0, 0);

			for (count=0; count < FSOUND_GetNumDrivers(); count++)
				ComboBox_AddString(DeviceComboHwnd, FSOUND_GetDriverName(count));

			ComboBox_SetCurSel(DeviceComboHwnd,0);
			UpdateWindow(DeviceComboHwnd);

			break;
		}

	};
	
	return (long)oldcomboproc(hwnd, message, wParam, lParam);
}


/*
	Window proc for dialog box
*/
#ifdef _WIN64
INT_PTR CALLBACK SoundDriverDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#else
BOOL CALLBACK SoundDriverDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#endif
{
	static HWND hCombo, hRadio, hCheckbox;
	static long *freq;
	static long lastoutput=0, lastdriver=0, lastmixer=0, lastoutputrate=44100;
    char str[1024];

	switch (msg)
	{
		case WM_INITDIALOG:
		{
            char str[1024];
			int count, buffersize, prebuffer_percent, rebuffer_percent, thisitem, cur;

			/*
                Remember what came in last
            */
			lastoutput	    = FSOUND_GetOutput();
			lastdriver      = FSOUND_GetDriver();
			lastmixer	    = FSOUND_GetMixer();
			lastoutputrate  = FSOUND_GetOutputRate();

#ifdef _WIN64
			if (lastmixer != FSOUND_MIXER_AUTODETECT &&
                lastmixer != FSOUND_MIXER_QUALITY_AUTODETECT &&
                lastmixer != FSOUND_MIXER_MONO &&
                lastmixer != FSOUND_MIXER_QUALITY_MONO) 
            {
                lastmixer = FSOUND_MIXER_QUALITY_AUTODETECT;
			}
#else
			if (lastmixer > FSOUND_MIXER_QUALITY_MMXP6)
            {
				lastmixer = FSOUND_MIXER_QUALITY_MMXP6;
            }
#endif

			if (lastoutput < FSOUND_OUTPUT_WINMM || lastoutput > FSOUND_OUTPUT_ASIO)
            {
				lastoutput = FSOUND_OUTPUT_DSOUND;		/* somehow lastoutput got corrupted */
            }
			if (lastdriver < 0)
            {
				lastdriver = 0;		/* somehow lastdriver got corrupted */
            }

			FSOUND_SetOutput(lastoutput);

			/*
                SET UP OUTPUT COMBO BOX
            */
			hCombo = GetDlgItem(hwnd,IDC_DSENUM_COMBO3);
			ComboBox_AddString(hCombo,"Direct Sound");
			ComboBox_AddString(hCombo,"Windows Multimedia WaveOut");
			ComboBox_AddString(hCombo,"ASIO Low latency");
			
			if (lastoutput == FSOUND_OUTPUT_DSOUND) 
            {
				ComboBox_SetCurSel(hCombo,0);
            }
			if (lastoutput == FSOUND_OUTPUT_WINMM) 
            {
				ComboBox_SetCurSel(hCombo,1);
            }
			if (lastoutput == FSOUND_OUTPUT_ASIO) 
            {
				ComboBox_SetCurSel(hCombo,2);
            }

			/*
                Subclass this combo box
            */
#ifdef _WIN64
			oldcomboproc = (WNDPROC)GetWindowLong(hCombo, GWLP_WNDPROC);
			SetWindowLong(hCombo, GWLP_WNDPROC, (LONG)ComboWindowProc);
#else
			oldcomboproc = (WNDPROC)GetWindowLong(hCombo, GWL_WNDPROC);
			SetWindowLong(hCombo, GWL_WNDPROC, (LONG)ComboWindowProc);
#endif

			/*
                SET UP MIXER COMBO BOX
            */
			hCombo = GetDlgItem(hwnd,IDC_DSENUM_COMBO2);
			ComboBox_AddString(hCombo,"Autodetect");
#ifndef _WIN64
			ComboBox_AddString(hCombo,"Interpolation/Volume Ramping - FPU ");
			ComboBox_AddString(hCombo,"Interpolation/Volume Ramping - Pentium MMX");
			ComboBox_AddString(hCombo,"Interpolation/Volume Ramping - P6/P2/P3+ MMX");
#endif

			if (lastmixer == FSOUND_MIXER_QUALITY_AUTODETECT)		ComboBox_SetCurSel(hCombo,0);
#ifndef _WIN64
			if (lastmixer == FSOUND_MIXER_QUALITY_FPU)				ComboBox_SetCurSel(hCombo,1);
			if (lastmixer == FSOUND_MIXER_QUALITY_MMXP5)			ComboBox_SetCurSel(hCombo,2);
			if (lastmixer == FSOUND_MIXER_QUALITY_MMXP6)			ComboBox_SetCurSel(hCombo,3);
#endif

			/*
                SET UP DRIVER COMBO BOX
            */
			hCombo = GetDlgItem(hwnd,IDC_DSENUM_COMBO);
			DeviceComboHwnd = hCombo;
			for (count=0; count < FSOUND_GetNumDrivers(); count++)
            {
				ComboBox_AddString(hCombo,FSOUND_GetDriverName(count));
            }

			if (ComboBox_GetCount(hCombo)) 
            {
				ComboBox_SetCurSel(hCombo, lastdriver);
            }

			/*
                SET UP FREQUENCY RADIO BUTTON
            */
			if      (lastoutputrate == 48000) 	hRadio = GetDlgItem(hwnd,IDC_RADIO5);
			else if (lastoutputrate == 44100) 	hRadio = GetDlgItem(hwnd,IDC_RADIO1);
			else if (lastoutputrate == 22050) 	hRadio = GetDlgItem(hwnd,IDC_RADIO2);
			else if (lastoutputrate == 11025) 	hRadio = GetDlgItem(hwnd,IDC_RADIO3);
			else if (lastoutputrate == 8000)	hRadio = GetDlgItem(hwnd,IDC_RADIO4);
			else 								hRadio = GetDlgItem(hwnd,IDC_RADIO1);

			freq = (long *)lParam;
			Button_SetCheck(hRadio, TRUE);

			/*
                SET UP INTERNET STREAMING VALUES
            */
            FSOUND_Stream_Net_GetBufferProperties(&buffersize, &prebuffer_percent, &rebuffer_percent);
            sprintf(str, "%d", buffersize);
            SetWindowText(GetDlgItem(hwnd, IDC_CONFIG_BUFFERSIZE), str);
            sprintf(str, "%d", prebuffer_percent);
            SetWindowText(GetDlgItem(hwnd, IDC_CONFIG_INITIALPERCENT), str);
            sprintf(str, "%d", rebuffer_percent);
            SetWindowText(GetDlgItem(hwnd, IDC_CONFIG_REBUFFERPERCENT), str);
            SetWindowText(GetDlgItem(hwnd, IDC_CONFIG_PROXY), setting_http_proxy);

            /*
                SET UP CD SETTINGS
            */
            thisitem = 0;
            hCombo = GetDlgItem(hwnd, IDC_CONFIG_CD);
            for (count=2;count < 26;count++)
            {
                sprintf(str, "%c:\\", (char)('A' + count));
                if (GetDriveType(str) == DRIVE_CDROM)
                {
                    str[2] = 0;
                    ComboBox_AddString(hCombo, str);
                    if (!strcmp(str, setting_cdletter))
                    {
                        cur = thisitem;
                    }
                    thisitem++;
                }
            }
            ComboBox_SetCurSel(hCombo, cur);

            hCheckbox = GetDlgItem(hwnd, IDC_CONFIG_CDDA);
            Button_SetCheck(hCheckbox, setting_cdda);

            hCheckbox = GetDlgItem(hwnd, IDC_CONFIG_JITTER);
            Button_SetCheck(hCheckbox, setting_jitter);

            hCheckbox = GetDlgItem(hwnd, IDC_CONFIG_FORCEASPI);
            Button_SetCheck(hCheckbox, setting_forceaspi);

			return TRUE;
		}

		case WM_COMMAND:
		{
			switch (LOWORD(wParam))
			{
				case IDOK :
                {
                    int buffersize, prebuffer_percent, rebuffer_percent;

					hCombo = GetDlgItem(hwnd,IDC_DSENUM_COMBO);
					
					FSOUND_SetDriver((char)ComboBox_GetCurSel(hCombo));
					
					if	    (Button_GetCheck(GetDlgItem(hwnd,IDC_RADIO5))) *freq = 48000;
					else if (Button_GetCheck(GetDlgItem(hwnd,IDC_RADIO1))) *freq = 44100;
					else if (Button_GetCheck(GetDlgItem(hwnd,IDC_RADIO2))) *freq = 22050;
					else if (Button_GetCheck(GetDlgItem(hwnd,IDC_RADIO3))) *freq = 11025;
					else if (Button_GetCheck(GetDlgItem(hwnd,IDC_RADIO4))) *freq = 8000;

					hCombo = GetDlgItem(hwnd,IDC_DSENUM_COMBO2);
					switch (ComboBox_GetCurSel(hCombo))
					{
						case 0: 
							FSOUND_SetMixer(FSOUND_MIXER_QUALITY_AUTODETECT);
							break;
						case 1: 
							FSOUND_SetMixer(FSOUND_MIXER_QUALITY_FPU);
							break;
						case 2: 
							FSOUND_SetMixer(FSOUND_MIXER_QUALITY_MMXP5);
							break;
						case 3: 
							FSOUND_SetMixer(FSOUND_MIXER_QUALITY_MMXP6);
							break;
					}

                    GetWindowText(GetDlgItem(hwnd, IDC_CONFIG_BUFFERSIZE), str, 1023);
                    buffersize = atoi(str);
                    GetWindowText(GetDlgItem(hwnd, IDC_CONFIG_INITIALPERCENT), str, 1023);
                    prebuffer_percent = atoi(str);
                    GetWindowText(GetDlgItem(hwnd, IDC_CONFIG_REBUFFERPERCENT), str, 1023);
                    rebuffer_percent = atoi(str);

                    if (buffersize < 8192)
                    {
                        MessageBox(hwnd, "Buffer size too small!", "Warning", MB_OK | MB_ICONWARNING);
                        return TRUE;
                    }

                    if ((prebuffer_percent <= 0) || (prebuffer_percent > 99))
                    {
                        MessageBox(hwnd, "Initial buffer percent must be between 1 - 99", "Warning", MB_OK | MB_ICONWARNING);
                        return TRUE;
                    }

                    if ((rebuffer_percent <= 0) || (rebuffer_percent > 99))
                    {
                        MessageBox(hwnd, "Rebuffer percent must be between 1 - 99", "Warning", MB_OK | MB_ICONWARNING);
                        return TRUE;
                    }

                    setting_buffersize        = buffersize;
                    setting_prebuffer_percent = prebuffer_percent;
                    setting_rebuffer_percent  = rebuffer_percent;
                    FSOUND_Stream_Net_SetBufferProperties(setting_buffersize, setting_prebuffer_percent, setting_rebuffer_percent);

                    GetWindowText(GetDlgItem(hwnd, IDC_CONFIG_PROXY), setting_http_proxy, 2047);
                    FSOUND_Stream_Net_SetProxy(setting_http_proxy);

                    hCombo = GetDlgItem(hwnd, IDC_CONFIG_CD);
					ComboBox_GetLBText(hCombo, ComboBox_GetCurSel(hCombo), str);
                    strncpy(setting_cdletter, str, 2);
                    cddevice = str[0];

                    hCheckbox = GetDlgItem(hwnd, IDC_CONFIG_CDDA);
                    setting_cdda = Button_GetCheck(hCheckbox);

                    hCheckbox = GetDlgItem(hwnd, IDC_CONFIG_JITTER);
                    setting_jitter = Button_GetCheck(hCheckbox);

                    hCheckbox = GetDlgItem(hwnd, IDC_CONFIG_FORCEASPI);
                    setting_forceaspi = Button_GetCheck(hCheckbox);

					EndDialog(hwnd,TRUE);
					return TRUE;
                }

				case IDCANCEL:
					FSOUND_SetOutput(lastoutput);
					FSOUND_SetDriver(lastdriver);
					FSOUND_SetMixer(lastmixer);

					EndDialog(hwnd, FALSE);
					return TRUE;

                case IDC_CONFIG_CDINFO :
                {
                    FILE *fp;
                    char cdstring[5];
                    char *cd_device_info;
                    FSOUND_STREAM *stream;
                    STARTUPINFO startup_info;
                    PROCESS_INFORMATION process_info;

                    if (!FSOUND_Init(44100, 4, 0))
                    {
                        MessageBox(hwnd, "ERROR: CD/DVD device info not available", "Error", MB_ICONERROR | MB_OK);
                        break;
                    }

                    hCombo = GetDlgItem(hwnd, IDC_CONFIG_CD);
					ComboBox_GetLBText(hCombo, ComboBox_GetCurSel(hCombo), str);
                    sprintf(cdstring, "%s*?", str);

                    stream = FSOUND_Stream_Open(cdstring, 0, 0, 0);
                    if (!stream)
                    {
                        MessageBox(hwnd, "ERROR: CD/DVD device info not available", "Error", MB_ICONERROR | MB_OK);
                        FSOUND_Close();
                        break;
                    }

                    if (FSOUND_Stream_FindTagField(stream, FSOUND_TAGFIELD_ASF + 1, "CD_DEVICE_INFO", (void **)&cd_device_info, 0))
                    {
                        fp = fopen("cd_device_info.txt", "wb");
                        fwrite(cd_device_info, 1, strlen(cd_device_info), fp);
                        fclose(fp);

                        memset(&startup_info, 0, sizeof(STARTUPINFO));
                        startup_info.cb = sizeof(STARTUPINFO);

                        if (CreateProcess(0, 
                                          "notepad cd_device_info.txt", 
                                          0, 
                                          0, 
                                          TRUE, 
                                          NORMAL_PRIORITY_CLASS, 
                                          0, 
                                          0, 
                                          &startup_info, 
                                          &process_info))
                        {
                            CloseHandle(process_info.hProcess);
                            CloseHandle(process_info.hThread);
                        }
                        else
                        {
                            MessageBox(hwnd, "ERROR: CD/DVD device info not available", "Error", MB_ICONERROR | MB_OK);
                        }
                    }
                    else
                    {
                        if (FSOUND_Stream_FindTagField(stream, FSOUND_TAGFIELD_ASF + 1, "CD_ERROR", (void **)&cd_device_info, 0))
                        {
                            MessageBox(hwnd, cd_device_info, "Error", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                        }
                        else
                        {
                            MessageBox(hwnd, "ERROR: CD/DVD device info not available", "Error", MB_ICONERROR | MB_OK);
                        }
                    }

                    FSOUND_Stream_Close(stream);
                    FSOUND_Close();
                    break;
                }

				case IDC_ABOUT :
				{
                    char tmp[128];
                    sprintf(tmp, "FMOD %.2f Media Player  Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004", FMOD_VERSION);
                    MessageBox(hwnd, tmp, "About", MB_OK);
                    break;
                }
			}
			break;
		}
		default:
		{
			return FALSE;
		}
	}

	return FALSE;
}

