@echo off
setlocal enabledelayedexpansion
set /a runs = 24
if exist timeit.dat del timeit.dat
for /f %%r in ( 'copy /Z %~f0 nul' ) do set cr=%%r
for /l %%i in ( 1, 1, !runs! ) do (
  < nul set /P = # %%i / !runs! !cr!
  timeit tasklist > nul 2>&1
  timeit fastlist > nul 2>&1
)
echo.
echo.
timeit -t
echo.
set /a excl = !runs! - !runs! / 5 * 4
echo !excl! runs excluded
echo.