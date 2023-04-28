@echo off

REM Set variables
set HOME_URL=https://<MY_SUBDOMAIN_HERE>.printercloud15.com/
set AUTH_CODE=<AUTH_CODE_HERE>
set MSI_FILE=PrinterInstallerClient.msi

REM Check for admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Admin privileges detected.
) else (
    echo This script requires admin privileges. Please run as administrator.
    exit /b 1
)

REM Get full path of installer file
set INSTALLER_PATH=%~dp0%MSI_FILE%
if not exist %INSTALLER_PATH% (
    echo Installer file %INSTALLER_PATH% not found.
    exit /b 1
)

REM Install the application
msiexec /i %INSTALLER_PATH% /qn HOMEURL=%HOME_URL% AUTHORIZATION_CODE=%AUTH_CODE%
if %errorLevel% == 0 (
    echo Installation successful.
    exit /b 0
) else (
    echo Installation failed.
    exit /b 1
)
