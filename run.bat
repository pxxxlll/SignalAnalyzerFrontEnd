@echo off
setlocal

:: 配置项
set "ENV_NAME=auto_env"
set "REQ_FILE=requirements.txt"
set "SCRIPT_PATH=src\controller_mach.py"

:: 检查文件是否存在
if not exist "%REQ_FILE%" (
    echo ❌ 缺少 %REQ_FILE%，请确保依赖列表存在。
    pause
    exit /b 1
)

if not exist "%SCRIPT_PATH%" (
    echo ❌ 缺少主程序 %SCRIPT_PATH%，无法运行。
    pause
    exit /b 1
)

:: 检查 conda 是否可用
where conda >nul 2>nul
if errorlevel 1 (
    echo ❌ 未找到 Conda，请确保已正确安装并配置了 PATH。
    pause
    exit /b 1
)

:: 检查环境是否存在
call conda env list | findstr /i "%ENV_NAME%" >nul
if errorlevel 1 (
    echo 🔧 创建 conda 环境 %ENV_NAME% 并安装依赖...
    call conda create -y -n %ENV_NAME% python=3.10
    call conda run -n %ENV_NAME% pip install -r "%REQ_FILE%"
) else (
    echo ✅ Conda 环境 %ENV_NAME% 已存在。
)

:: 启动程序
echo 🚀 正在启动程序：%SCRIPT_PATH%
call conda run -n %ENV_NAME% python "%SCRIPT_PATH%"

pause
