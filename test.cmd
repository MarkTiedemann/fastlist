@echo off
setlocal

:: Determine Windows version using `ver`
:: C:\>ver
:: Microsoft Windows [Version 10.0.18362.657]
for /f "delims=" %%i in ('ver') do set ver=%%i
:: Cut version string from command output
:: - Cut first 27 chars ("Microsoft Windows [Version ".length)
::   from the start of the string
:: - Remove last char ("]") from the end of the string
set windows_version=%ver:~27,-1%
:: => 10.0.18362.657

:: Check Docker is installed
where docker 1> nul 2> nul
if %errorlevel% neq 0 (
    echo Error: Please install Docker for Windows 2>&1
    exit /b 1
)

:: Check Docker is started
docker version 1> nul 2> nul
if %errorlevel% neq 0 (
    echo Error: Please start Docker 2>&1
    exit /b 1
)

:: Check Docker is using Windows containers
docker info | findstr OSType: | findstr windows 1> nul 2> nul
if %errorlevel% neq 0 (
    echo Error: Please switch to Docker Windows containers 2>&1
    exit /b 1
)

:: Pull matching Docker image (if not already available)
docker images | findstr %windows_version% 1> nul 2> nul
if %errorlevel% neq 0 (
    echo Warning: Pulling required image from Docker Hub 2>&1
    docker pull mcr.microsoft.com/windows:%windows_version%
)

for /f %%v in (VERSION) do (
	for %%a in (x86 x64) do (
        :: Run test in container
        docker run --rm --interactive --tty --volume %cd%:C:\volume mcr.microsoft.com/windows:%windows_version% cmd /c .\volume\fastlist-%%v-%%a.exe
        if %errorlevel% neq 0 (
            echo Error: Test failed with error level: %errorlevel%
            exit /b 1
        )
    )
)

echo.
echo Info: Test passed
