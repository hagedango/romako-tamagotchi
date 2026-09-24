@echo off
rem 3D版（ロマ子様の部屋）をローカルサーバーで開く
rem ひとつ上のフォルダをサーバーにするので、2Dクラシック版（../index.html）とも行き来できる
cd /d "%~dp0.."
where python >nul 2>nul
if errorlevel 1 (
  echo Python が見つかりません。https://www.python.org/ からインストールしてください。
  echo または、この 3d フォルダの index.html をダブルクリックしても遊べます。
  pause
  exit /b 1
)
echo ロマ子様の部屋（3D版）を開きます…
echo 最小化された黒い画面がサーバーです。遊び終わったら閉じてください。
start "romaco-3d-server" /min python -m http.server 8765 --bind 127.0.0.1
timeout /t 2 /nobreak >nul
start "" "http://localhost:8765/3d/index.html"
