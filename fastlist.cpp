#include <windows.h>
#include <tlhelp32.h>
#include <atlconv.h>
#include <atlbase.h>
#include <iostream>

int main()
{
	if (!SetConsoleOutputCP(CP_UTF8)) {
		return 1;
	}

	HANDLE snap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	if (snap == INVALID_HANDLE_VALUE)
	{
		return 1;
	}

	PROCESSENTRY32 entry;
	entry.dwSize = sizeof(PROCESSENTRY32);

	if (!Process32First(snap, &entry))
	{
		CloseHandle(snap);
		return 1;
	}

	do
	{
		CW2A exe(entry.szExeFile, CP_UTF8);
		std::cout << entry.th32ProcessID << "\t" << entry.th32ParentProcessID << "\t" << exe.m_psz << "\n";
	} while (Process32Next(snap, &entry));
	CloseHandle(snap);
	return 0;
}
