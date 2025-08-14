@echo off
title Mobil Erisim - Yatirim Tesvik Belgesi Arama
color 0A

echo.
echo ========================================
echo   MOBIL ERISIM KURULUMU
echo ========================================
echo.
echo Hangi yontemi kullanmak istiyorsunuz?
echo.
echo 1. Ngrok Tüneli (Hizli ve kolay)
echo 2. Cloudflare Tunnel (Ucretsiz ve guvenli)
echo 3. Manuel IP Adresi (Ayni WiFi gerekli)
echo 4. Cikis
echo.
set /p choice="Seciminizi yapin (1-4): "

if "%choice%"=="1" goto ngrok
if "%choice%"=="2" goto cloudflare
if "%choice%"=="3" goto manual
if "%choice%"=="4" goto exit
goto invalid

:ngrok
echo.
echo ========================================
echo   NGROK TUNELI BASLATILIYOR
echo ========================================
echo.

REM Ngrok kurulu mu kontrol et
if not exist "ngrok.exe" (
    echo ❌ Ngrok bulunamadi!
    echo.
    echo 📥 Ngrok'u indirmek icin:
    echo 1. https://ngrok.com adresine gidin
    echo 2. Ucretsiz hesap olusturun
    echo 3. ngrok.exe dosyasini indirin
    echo 4. Bu klasore kopyalayin
    echo.
    pause
    goto menu
)

echo 🚀 Ngrok tüneli baslatiliyor...
echo 📱 Mobil cihazlarinizdan erisim icin URL'yi bekleyin...
echo.

REM Flask uygulamasini arka planda baslat
start /B python app.py

REM Kisa bir bekleme
timeout /t 3 /nobreak >nul

REM Ngrok'u baslat
ngrok http 5000

goto cleanup

:cloudflare
echo.
echo ========================================
echo   CLOUDFLARE TUNNEL BASLATILIYOR
echo ========================================
echo.

REM Cloudflared kurulu mu kontrol et
if not exist "cloudflared.exe" (
    echo ❌ Cloudflared bulunamadi!
    echo.
    echo 📥 Cloudflared'i indirmek icin:
    echo 1. https://github.com/cloudflare/cloudflared/releases adresine gidin
    echo 2. cloudflared-windows-amd64.exe dosyasini indirin
    echo 3. cloudflared.exe olarak yeniden adlandirin
    echo 4. Bu klasore kopyalayin
    echo.
    pause
    goto menu
)

echo 🚀 Cloudflare tüneli baslatiliyor...
echo 📱 Mobil cihazlarinizdan erisim icin URL'yi bekleyin...
echo.

REM Flask uygulamasini arka planda baslat
start /B python app.py

REM Kisa bir bekleme
timeout /t 3 /nobreak >nul

REM Cloudflared'i baslat
cloudflared.exe tunnel --url http://localhost:5000

goto cleanup

:manual
echo.
echo ========================================
echo   MANUEL IP ADRESI
echo ========================================
echo.

REM IP adresini al
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set ip=%%a
    set ip=!ip: =!
    goto :found_ip
)

:found_ip
echo 📱 Bilgisayarinizin IP adresi: %ip%
echo.
echo 🔗 Mobil cihazlarinizdan bu adresi kullanin:
echo    http://%ip%:5000
echo.
echo ⚠️  NOT: Bu yontem icin ayni WiFi aginda olmaniz gerekir!
echo.
echo 🚀 Flask uygulamasi baslatiliyor...
echo.

REM Flask uygulamasini baslat
python app.py

goto cleanup

:invalid
echo.
echo ❌ Gecersiz secim! Lutfen 1-4 arasinda bir sayi girin.
echo.
pause
goto menu

:cleanup
echo.
echo 🛑 Uygulama kapatildi.
echo.

:exit
echo Cikis yapiliyor...
exit
