// ExOpener.cpp : アプリケーションのエントリ ポイントを定義します。
//
#include <agents.h>
#include <windows.h>
#include <iostream>
#include <string>
#include <chrono>
#include <thread>
#include "framework.h"
#include <winbase.h>

using std::this_thread::sleep_for;
using namespace concurrency;
using namespace std;

constexpr int TIME_TO_SLEEP = 1001;

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    char cb[256] = { 0 };
    char latestcb[256] = { 0 };
    while (1) {
        OpenClipboard(NULL);
        HANDLE  hText = GetClipboardData(CF_TEXT);
        if (hText != NULL) {            
            LPVOID pText = GlobalLock(hText);
            strcpy_s(cb, (char *)pText);
            WCHAR aa[256];
            size_t ret;
            mbstowcs_s(&ret, aa, 256, cb, 256);
            GlobalUnlock(hText);
        }
        CloseClipboard();

//        sleep_for(std::chrono::milliseconds(TIME_TO_SLEEP)); // for debug

        if (cb[0] == '\\' && cb[1] == '\\') {
            printf("FilePath\n");
            TCHAR  title[256];
            char  result[256] = { 0 };
            LPSTR tmp;
            HWND hWnd;

            tmp = result;
            hWnd = GetForegroundWindow();
            GetWindowText(hWnd, title, 256);
            WideCharToMultiByte(CP_ACP, WC_NO_BEST_FIT_CHARS, title, 256, tmp, 256, NULL, NULL);
            if ( memcmp(cb, tmp, strlen(cb)) && memcmp(cb, latestcb, strlen(cb)) ) {
                printf("NewPath\n");
                memcpy(latestcb, cb, strlen(cb));
            }
        }
        sleep_for(std::chrono::milliseconds(TIME_TO_SLEEP));
    }
    return 0;
}

