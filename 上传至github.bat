@echo off
chcp 65001 >nul
echo ============================================
echo   Lytalk Download 仓库一键部署
echo ============================================
echo.

cd /d "%~dp0"

echo [1/4] 检查 Git 状态...
git status --short
echo.

echo [2/4] 添加所有文件...
git add .
echo.

echo [3/4] 提交更改...
set datetime=%date% %time%
git commit -m "deploy: %datetime%"
if errorlevel 1 (
    echo 没有新变更需要提交，跳过 commit。
)
echo.

echo [4/4] 推送到 GitHub（强制覆盖远程）...
git push -u origin main --force
if errorlevel 1 (
    echo.
    echo [错误] 推送失败，请检查网络或 Git 配置。
    pause
    exit /b 1
)

echo.
echo ============================================
echo   部署成功！
echo   访问地址：
echo   https://download.rincatia.com/latest.json
echo ============================================
echo.
pause