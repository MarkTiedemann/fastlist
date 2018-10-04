#include <windows.h>
#include <stdio.h>
#include <tlhelp32.h>

int main(void)
{
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
    printf("%s\t%lu\n", entry.szExeFile, entry.th32ProcessID);
  } while (Process32Next(snap, &entry));
  CloseHandle(snap);
  return 0;
}