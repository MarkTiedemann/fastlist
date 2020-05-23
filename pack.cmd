@echo off
if not exist upx-3.96-x64.exe (
    curl -LO https://github.com/upx/upx/releases/download/v3.96/upx-3.96-win64.zip
    powershell -c "Expand-Archive -Path upx-3.96-win64.zip -DestinationPath ."
    del upx-3.96-win64.zip
    move upx-3.96-win64\upx.exe upx-3.96-x64.exe
    rd /q /s upx-3.96-win64
)
upx-3.96-x64.exe fastlist-0.2.0-x86.exe
upx-3.96-x64.exe fastlist-0.2.0-x64.exe
