@echo off

call shasum -a 256 fastlist-0.2.0-x64.exe > fastlist-0.2.0-x64.sha256
call shasum -c fastlist-0.2.0-x64.sha256

call shasum -a 256 fastlist-0.2.0-x86.exe > fastlist-0.2.0-x86.sha256
call shasum -c fastlist-0.2.0-x86.sha256

:: curl -fsS https://marksweb.site/pubkey.gpg | gpg --import

call gpg --armor --detach-sig --output fastlist-0.2.0-x64.sha256.sig fastlist-0.2.0-x64.sha256
call gpg --verify fastlist-0.2.0-x64.sha256.sig fastlist-0.2.0-x64.sha256

call gpg --armor --detach-sig --output fastlist-0.2.0-x86.sha256.sig fastlist-0.2.0-x86.sha256
call gpg --verify fastlist-0.2.0-x86.sha256.sig fastlist-0.2.0-x86.sha256
