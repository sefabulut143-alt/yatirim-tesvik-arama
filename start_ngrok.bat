@echo off
echo 🌐 Mobil Erisim - Ngrok Tüneli
echo ================================
echo.

REM Ngrok kurulu mu kontrol et
if not exist "ngrok.exe" (
    echo ❌ Ngrok bulunamadi!
    echo 📥 Lutfen https://ngrok.com adresinden indirin
    echo 📁 ngrok.exe dosyasini bu klasore kopyalayin
    pause
    exit
)

echo 🚀 Ngrok tüneli baslatiliyor...
echo 📱 Mobil cihazlarinizdan erisim icin URL'yi bekleyin...
echo.

REM Ngrok'u baslat
ngrok http 5000

echo.
echo 🛑 Tünel kapatildi.
pause

