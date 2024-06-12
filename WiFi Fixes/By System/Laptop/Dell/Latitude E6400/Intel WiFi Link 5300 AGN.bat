TITLE Restarting WiFi Device "Intel 5300 AGN"

@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
rem --- FROM HERE PASTE YOUR ADMIN-ENABLED BATCH SCRIPT ---
echo Restarting WiFi Device "Intel 5300 AGN"
pnputil /disable-device "PCI\VEN_8086&DEV_4235&SUBSYS_11218086&REV_00\4&73CCF11&0&00E1"
pnputil /enable-device "PCI\VEN_8086&DEV_4235&SUBSYS_11218086&REV_00\4&73CCF11&0&00E1"
rem --- END OF BATCH ----