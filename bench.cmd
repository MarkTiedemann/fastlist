@echo off

if not exist timeit.exe (
	curl -LO https://github.com/MarkTiedemann/rktools2k3/raw/master/timeit.exe
)

if exist timeit.dat (
	del timeit.dat
)

:: Get carriage return
for /f %%c in ('copy /z %~f0 nul') do (
	for /f %%v in (VERSION) do (
		for /l %%i in (1, 1, 100) do (
			< nul set /p="Run: %%i/100%%c"
			timeit.exe tasklist.exe > nul 2> nul
			timeit.exe wmic.exe process get name,processid,parentprocessid > nul 2> nul
			for %%a in (x86 x64) do (
				timeit.exe fastlist-%%v-%%a.exe > nul 2> nul
			)
		)
		< nul set /p=%%c
	)
)

timeit.exe -t
