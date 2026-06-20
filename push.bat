@echo off
chcp 65001 >nul
echo ==============================================
echo 流程：拉取远程最新 → 合并 → 提交本地 → 安全强制推送
echo 作用：保留仓库新增小说，再同步本地修改
echo ==============================================
echo 1. 拉取远程main分支全部最新内容
git pull origin main --allow-unrelated-histories
echo.
echo 2. 添加本地所有修改文件
git add .
echo.
echo 3. 提交本次更新记录
git commit -m "拉取远程同步+本地修改合并更新"
echo.
echo 4. 安全强制推送（检测远程新提交，不会误删远程新增小说）
git push --force-with-lease origin main
echo.
echo ==============================================
echo 同步完成，按任意键关闭窗口
echo ==============================================
pause >nul