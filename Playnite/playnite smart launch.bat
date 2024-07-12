setlocal

:: Check for the presence of a game controller
wmic path Win32_PnPSignedDriver where "DeviceName like '%%HID-compliant game controller%%'" get DeviceName >nul 2>&1

:: Check if the above command was successful
if %errorlevel% == 0 (
cd %appdata%
cd ..
cd Local\Playnite
start Playnite.FullscreenApp.exe
) else (
cd %appdata%
cd ..
cd Local\Playnite
start Playnite.DesktopApp.exe
)

endlocal