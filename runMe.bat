@echo off
setlocal

set "SOURCE=%~dp0"
set "DEST=%APPDATA%\.minecraft"

echo.
echo Installing Minecraft files...
echo Destination: "%DEST%"
echo.

if not exist "%DEST%\" mkdir "%DEST%"

REM Copy new files everywhere except config.
REM Existing files outside config are never overwritten.
robocopy "%SOURCE%" "%DEST%" /E /XC /XN /XO ^
    /XD "%SOURCE%config" ^
    /XF "%~nx0" ^
    /R:2 /W:1

REM Copy config separately and overwrite matching configuration files.
if exist "%SOURCE%config\" (
    robocopy "%SOURCE%config" "%DEST%\config" /E /R:2 /W:1
)

echo.
echo Installation complete.
echo You may now open Minecraft.
pause

endlocal
