@echo off
title Ag Baglantisi Sorunu Cozumu - Yatirim Tesvik Belgesi Arama
color 0B

echo.
echo ========================================
echo   AG BAGLANTISI SORUNU COZUMU
echo ========================================
echo.
echo api.github.com adresine erisim sorunu cozuluyor...
echo.

:: DNS ayarlarını kontrol et
echo DNS ayarlari kontrol ediliyor...
nslookup api.github.com

:: Alternatif DNS ayarları
echo Alternatif DNS ayarlari deneniyor...
ipconfig /flushdns
echo DNS cache temizlendi.

:: GitHub'a ping at
echo GitHub'a ping atiliyor...
ping -n 3 api.github.com

:: HTTPS bağlantısını test et
echo HTTPS baglantisi test ediliyor...
powershell -Command "try { Invoke-WebRequest -Uri 'https://api.github.com' -TimeoutSec 10 | Select-Object StatusCode } catch { Write-Host 'Baglanti hatasi: ' $_.Exception.Message }"

echo.
echo ========================================
echo   ALTERNATIF COZUMLER
echo ========================================
echo.
echo Eger hala baglanti sorunu varsa:
echo.
echo 1. Internet baglantinizi kontrol edin
echo 2. Firewall ayarlarini kontrol edin
echo 3. VPN kullaniyorsaniz kapatip deneyin
echo 4. Farkli bir ag baglantisi deneyin
echo.
echo ========================================
echo   MANUEL GITHUB YUKLEME
echo ========================================
echo.
echo Ag sorunu varsa manuel olarak yukleyin:
echo.
echo 1. https://github.com/sefabulut143-alt/yatirim-tesvik-arama adresine gidin
echo 2. "Add file" > "Upload files" secin
echo 3. Tum dosyalari secin ve yukleyin
echo 4. "Commit changes" butonuna tiklayin
echo.
echo ========================================
echo   SONRAKI ADIM: RAILWAY DEPLOY
echo ========================================
echo.
echo Dosyalar yuklendikten sonra:
echo 1. https://railway.app adresine gidin
echo 2. GitHub hesabinizla giris yapin (sefabulut143-alt)
echo 3. "Deploy from GitHub" secin
echo 4. yatirim-tesvik-arama repo'sunu secin
echo 5. Otomatik deploy baslar!
echo.
pause
