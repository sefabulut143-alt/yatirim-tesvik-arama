@echo off
title Cloud Deployment - Yatirim Tesvik Belgesi Arama
color 0B

echo.
echo ========================================
echo   CLOUD DEPLOYMENT KURULUMU
echo ========================================
echo.
echo Bu script uygulamanizi cloud'a deploy etmek icin
echo gerekli dosyalari olusturur.
echo.
echo Hangi platform icin hazirlik yapmak istiyorsunuz?
echo.
echo 1. Railway (En kolay - Onerilen)
echo 2. Render (Guvenilir)
echo 3. Heroku (Klasik)
echo 4. Docker (Her yerde calisir)
echo 5. Hepsi
echo 6. Cikis
echo.
set /p choice="Seciminizi yapin (1-6): "

if "%choice%"=="1" goto railway
if "%choice%"=="2" goto render
if "%choice%"=="3" goto heroku
if "%choice%"=="4" goto docker
if "%choice%"=="5" goto all
if "%choice%"=="6" goto exit
goto invalid

:railway
echo.
echo ========================================
echo   RAILWAY DEPLOYMENT DOSYALARI
echo ========================================
echo.
python deploy_cloud.py
echo.
echo Railway icin hazirlik tamamlandi!
echo.
echo Sonraki adimlar:
echo 1. GitHub'a projeyi yukleyin
echo 2. https://railway.app adresine gidin
echo 3. "Deploy from GitHub" secin
echo 4. Repo'nuzu secin ve deploy edin
echo.
pause
goto exit

:render
echo.
echo ========================================
echo   RENDER DEPLOYMENT DOSYALARI
echo ========================================
echo.
python deploy_cloud.py
echo.
echo Render icin hazirlik tamamlandi!
echo.
echo Sonraki adimlar:
echo 1. GitHub'a projeyi yukleyin
echo 2. https://render.com adresine gidin
echo 3. "New Web Service" secin
echo 4. GitHub repo'nuzu baglayin
echo.
pause
goto exit

:heroku
echo.
echo ========================================
echo   HEROKU DEPLOYMENT DOSYALARI
echo ========================================
echo.
python deploy_cloud.py
echo.
echo Heroku icin hazirlik tamamlandi!
echo.
echo Sonraki adimlar:
echo 1. GitHub'a projeyi yukleyin
echo 2. https://heroku.com adresine gidin
echo 3. "Create new app" secin
echo 4. GitHub repo'nuzu baglayin
echo.
pause
goto exit

:docker
echo.
echo ========================================
echo   DOCKER DEPLOYMENT DOSYALARI
echo ========================================
echo.
python deploy_cloud.py
echo.
echo Docker icin hazirlik tamamlandi!
echo.
echo Sonraki adimlar:
echo 1. Docker kurulu oldugundan emin olun
echo 2. docker build -t ytb-arama .
echo 3. docker run -p 5000:5000 ytb-arama
echo.
pause
goto exit

:all
echo.
echo ========================================
echo   TUM PLATFORMLAR ICIN HAZIRLIK
echo ========================================
echo.
python deploy_cloud.py
echo.
echo Tum platformlar icin hazirlik tamamlandi!
echo.
echo Olusturulan dosyalar:
echo - railway.json
echo - render.yaml
echo - Procfile
echo - runtime.txt
echo - Dockerfile
echo - DEPLOYMENT_GUIDE.md
echo.
echo DEPLOYMENT_GUIDE.md dosyasini okuyun!
echo.
pause
goto exit

:invalid
echo.
echo ❌ Gecersiz secim! Lutfen 1-6 arasinda bir sayi girin.
echo.
pause
goto menu

:exit
echo Cikis yapiliyor...
exit

