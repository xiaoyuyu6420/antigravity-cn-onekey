@echo off
setlocal EnableDelayedExpansion
title Antigravity 还原官方英文

rem ==== 固定配置 ====
set "AG_RESOURCES=%LOCALAPPDATA%\Programs\antigravity\resources"
set "AG_EXE=%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"

echo.
echo ============================================
echo   Antigravity 还原官方英文（无痕还原）
echo ============================================
echo.

if not exist "%AG_EXE%" (
    echo [×] 未找到 Antigravity: %AG_EXE%
    pause
    exit /b 1
)

rem ==== 1. 关闭 Antigravity ====
echo [1/3] 关闭 Antigravity ...
taskkill /f /im Antigravity.exe >nul 2>&1
ping -n 3 127.0.0.1 >nul

rem ==== 2. 还原备份 ====
echo [2/3] 从备份还原官方 app.asar ...
if not exist "%AG_RESOURCES%\app.asar.bak" (
    echo [×] 未找到备份文件 app.asar.bak —— 可能还没汉化过，无需还原。
    pause
    exit /b 1
)
copy /y "%AG_RESOURCES%\app.asar.bak" "%AG_RESOURCES%\app.asar" >nul
if errorlevel 1 (
    echo [×] 还原失败，文件可能被占用，稍后再试。
    pause
    exit /b 1
)

rem ==== 3. 清缓存并重启 ====
echo [3/3] 清理缓存并重启 Antigravity ...
for %%D in ("%APPDATA%\Antigravity\Cache" "%APPDATA%\Antigravity\Code Cache" "%APPDATA%\Antigravity\GPUCache") do (
    if exist "%%~D" rd /s /q "%%~D"
)
start "" "%AG_EXE%"
echo [√] 已还原官方英文版。
ping -n 6 127.0.0.1 >nul
exit /b 0
