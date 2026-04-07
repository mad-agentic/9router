@echo off
setlocal

cd /d "%~dp0"

set "PORT=20128"
set "HOSTNAME=0.0.0.0"
set "NEXT_PUBLIC_BASE_URL=http://localhost:20128"

if /I "%~1"=="prod" goto :prod
goto :dev

:dev
echo [9Router] Starting local DEV server on http://localhost:%PORT%
call npm run dev
goto :done

:prod
echo [9Router] Building production bundle...
call npm run build
if errorlevel 1 goto :error

echo [9Router] Starting production server on http://localhost:%PORT%
call npm run start
goto :done

:error
echo.
echo [9Router] Command failed. Check logs above.
pause
exit /b 1

:done
if errorlevel 1 goto :error
endlocal
