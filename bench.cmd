@echo off
setlocal enabledelayedexpansion

:: determine run count (either first argument or 100 by default)
set "runs="&for /f "delims=0123456789" %%i in ( "%1" ) do set runs=%%i
if defined runs (
  set /a runs = 100
) else (
  if "%1" == "" ( set /a runs = 100 ) else ( set /a runs = %1 )
)

:: cleanup temp files
if exist timeit.dat del timeit.dat
if exist timeit.res del timeit.res
if exist timeit.cnt del timeit.cnt

:: get carriage return
for /f %%r in ( 'copy /Z %~f0 nul' ) do set cr=%%r

for /l %%i in ( 1, 1, !runs! ) do (
  :: print progress
  < nul set /P = # %%i / !runs! !cr!

  :: run benchmark
  timeit tasklist > nul 2>&1
  timeit fastlist > nul 2>&1
)

:: count excluded runs
timeit -d -t > timeit.res 2>&1
findstr EXCL timeit.res | find /c /v "@" > timeit.cnt
for /f "delims=" %%x in ( timeit.cnt ) do set excl=%%x
set /a excl = %excl% / 2

:: print results
echo.
echo.
timeit -t
echo.
echo !excl! runs excluded each