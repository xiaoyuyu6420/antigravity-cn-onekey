@echo off
setlocal EnableDelayedExpansion
title Antigravity 一键中文汉化

rem ==== 固定配置 ====
set "UPSTREAM=https://github.com/qqxpee/antigravity2-cn"
set "ENGINE_DIR=%USERPROFILE%\antigravity2-cn"
set "AG_EXE=%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"

echo.
echo ============================================
echo   Antigravity 2.x 一键中文汉化（引导版）
echo   引擎来源: qqxpee/antigravity2-cn
echo ============================================
echo.

rem ==== 0. 环境自检 ====
if not exist "%AG_EXE%" (
    echo [×] 未找到 Antigravity: %AG_EXE%
    echo     请先从 antigravity.google 下载安装 Antigravity 2.x。
    pause
    exit /b 1
)
where node >nul 2>&1
if errorlevel 1 (
    echo [×] 未检测到 Node.js，请先安装: https://nodejs.org
    pause
    exit /b 1
)
where git >nul 2>&1
if errorlevel 1 (
    echo [×] 未检测到 git，请先安装: https://git-scm.com
    pause
    exit /b 1
)

rem ==== 1. 关闭 Antigravity ====
echo [1/4] 关闭 Antigravity ...
taskkill /f /im Antigravity.exe >nul 2>&1

echo 等待文件锁释放 ...
ping -n 3 127.0.0.1 >nul

rem ==== 2. 准备引擎 ====
echo [2/4] 准备汉化引擎（首次自动克隆，约 10 秒超时保护）...
if not exist "%ENGINE_DIR%\localization_engine.js" (
    git clone --depth 1 "%UPSTREAM%" "%ENGINE_DIR%" 2>nul
    if errorlevel 1 (
        echo [×] 克隆引擎仓库失败：请检查网络，或手动执行
        echo     git clone %UPSTREAM% "%ENGINE_DIR%"
        pause
        exit /b 1
    )
) else (
    pushd "%ENGINE_DIR%"
    git -c http.lowSpeedLimit=1000 -c http.lowSpeedTime=10 pull --quiet 2>nul
    popd
)

rem ==== 3. 注入 ====
echo [3/4] 注入汉化（约 1 分钟）...
pushd "%ENGINE_DIR%"
node localization_engine.js --brand-title english
set "RC=!errorlevel!"
popd
if not "!RC!"=="0" (
    echo.
    echo [×] 注入失败（退出码 !RC!），把上方报错发给 AI 或提 issue。
    pause
    exit /b !RC!
)

rem ==== 4. 重启应用 ====
echo [4/4] 完成！正在启动 Antigravity ...
start "" "%AG_EXE%"
ping -n 3 127.0.0.1 >nul
echo [√] 汉化完成。官方每次自动更新后界面会变回英文，再双击本脚本即可。
ping -n 6 127.0.0.1 >nul
exit /b 0
