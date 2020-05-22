#include <windows.h>
#include <io.h>
#include <fcntl.h>
#include <tlhelp32.h>
#include <iostream>

int main()
{
	_setmode(_fileno(stdout), _O_U16TEXT);

	HANDLE snap;
	PROCESSENTRY32 entry;

	snap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	if (snap == INVALID_HANDLE_VALUE)
	{
		return 1;
	}

	entry.dwSize = sizeof(PROCESSENTRY32);

	if (!Process32First(snap, &entry))
	{
		CloseHandle(snap);
		return 1;
	}

	do
	{
		std::wcout << entry.th32ProcessID << "\t" << entry.th32ParentProcessID << "\t" << entry.szExeFile << "\n";
	} while (Process32Next(snap, &entry));
	CloseHandle(snap);
	return 0;
}
