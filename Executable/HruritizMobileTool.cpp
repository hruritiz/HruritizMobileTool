#include <windows.h>
#include <stdio.h>
int WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    char exePath[MAX_PATH];
    GetModuleFileNameA(NULL, exePath, MAX_PATH);
    char* lastSlash = strrchr(exePath, '\\');
    if (lastSlash) *(lastSlash + 1) = '\0';
    char splash[MAX_PATH];
    sprintf_s(splash, "%ssplash.hta", exePath);
    char mshta[MAX_PATH];
    if (GetSystemDirectoryA(mshta, MAX_PATH) == 0)
    {
        AllocConsole();
        freopen("CONOUT$", "w", stdout);
        printf("Error: cannot get system directory\n");
        getchar();
        return 1;
    }
    strcat_s(mshta, "\\mshta.exe");
    if (GetFileAttributesA(mshta) == INVALID_FILE_ATTRIBUTES)
    {
        AllocConsole();
        freopen("CONOUT$", "w", stdout);
        printf("Error: mshta.exe not found!\n");
        getchar();
        return 1;
    }
    if (GetFileAttributesA(splash) == INVALID_FILE_ATTRIBUTES)
    {
        return 0;
    }
    char cmd[MAX_PATH*2];
    sprintf_s(cmd, "\"%s\" \"%s\"", mshta, splash);
    STARTUPINFOA si = { sizeof(si) };
    si.dwFlags = STARTF_USESHOWWINDOW;
    si.wShowWindow = SW_HIDE;
    PROCESS_INFORMATION pi;
    CreateProcessA(NULL, cmd, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi);
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
    return 0;
}
