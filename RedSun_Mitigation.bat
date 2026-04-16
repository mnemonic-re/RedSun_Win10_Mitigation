@echo off
echo ============================================
echo   RedSun Mitigation Helper - Backup + Open
echo ============================================
echo.

:: 1. Create the backup on the Desktop
echo [1/2] Backing up the registry key to your Desktop...
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{50d185b9-fff3-4656-92c7-e4018da4361d}" "%USERPROFILE%\Desktop\RedSun_Key_Backup.reg" /y

if %errorlevel% neq 0 (
    echo [!] Error: Could not back up the key. Are you running this as Administrator?
    pause
    exit /b
)

echo [+] Backup successful! File: RedSun_Key_Backup.reg
echo.

:: 2. Open directly to the target key
echo [2/2] Opening Registry Editor to the exact location...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /v "LastKey" /t REG_SZ /d "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{50d185b9-fff3-4656-92c7-e4018da4361d}" /f >nul

:: Launch Regedit
start regedit

echo.
echo ======================================================================================================
echo done! Regedit is now open. 
echo Now just right-click the folder, go to Permissions and deny standard Users.
echo ======================================================================================================
pause
