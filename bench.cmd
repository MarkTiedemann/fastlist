@echo off
setlocal enabledelayedexpansion

if not exist timeit.exe (
  curl -LO https://github.com/kodybrown/rktools2k3/raw/master/timeit.exe
)

:: Cleanup temp files
if exist timeit.dat del timeit.dat
if exist timeit.res del timeit.res
if exist timeit.cnt del timeit.cnt

:: Get carriage return
for /f %%r in ('copy /Z %~f0 nul') do set cr=%%r

for /f %%v in (VERSION) do set v=%%v

for /l %%i in (1, 1, 100) do (
  :: Print progress
  < nul set /P = # %%i / 100 !cr!

  :: Run benchmark
  timeit.exe tasklist.exe > nul 2>&1
  timeit.exe wmic.exe process get name,processid,parentprocessid > nul 2>&1
  timeit.exe fastlist-!v!-x86.exe > nul 2>&1
  timeit.exe fastlist-!v!-x64.exe > nul 2>&1
)

:: Count excluded runs
timeit.exe -d -t > timeit.res 2>&1
findstr EXCL timeit.res | find /c /v "@" > timeit.cnt
for /f "delims=" %%x in (timeit.cnt) do set excl=%%x
set /a excl = %excl% / 2

:: Print results
echo.
echo.
timeit.exe -t
echo.
echo !excl! runs excluded each
