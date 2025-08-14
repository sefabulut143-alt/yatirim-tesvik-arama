@echo off
title Render Deployment - Yatirim Tesvik Belgesi Arama
color 0B

echo.
echo ========================================
echo   RENDER DEPLOYMENT
echo ========================================
echo.
echo Railway yerine Render kullaniliyor...
echo Ucretsiz ve sinirsiz!
echo.

:: Git kontrol et
echo Git kontrol ediliyor...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git yuklu degil! Once Git'i yukleyin.
    pause
    exit /b 1
)

:: Git kullanıcı konfigürasyonu
echo Git konfigurasyonu yapiliyor...
git config --global user.name "sefabulut143-alt"
git config --global user.email "sefabulut143@gmail.com"

:: Git repo başlat
echo Git repo baslatiliyor...
git init
git add .
git commit -m "Initial commit - Yatirim Tesvik Belgesi Arama"
git branch -M main

:: Remote ekle
echo Remote ekleniyor...
git remote remove origin 2>nul
git remote add origin https://github.com/sefabulut143-alt/yatirim-tesvik-arama.git

echo.
echo ========================================
echo   GITHUB TOKEN GEREKLI
echo ========================================
echo.
echo GitHub token'inizi girmeniz gerekiyor.
echo.
echo 1. https://github.com/settings/tokens adresine gidin
echo 2. "Generate new token (classic)" secin
echo 3. Note: "Yatirim Tesvik Arama Token"
echo 4. Expiration: "No expiration"
echo 5. Scopes: "repo" kutusunu isaretleyin
echo 6. "Generate token" butonuna tiklayin
echo 7. Token'i kopyalayin
echo.
echo Token'i aldiktan sonra bu pencereye donun
echo ve herhangi bir tusa basin.
echo.
pause

:: Push işlemi
echo GitHub'a yukleniyor...
echo.
echo GitHub token'inizi girmeniz gerekecek.
echo Sifre olarak token'i girin.
echo.
git push -u origin main

echo.
echo ========================================
echo   RENDER DEPLOYMENT
echo ========================================
echo.
echo Render'da deploy ediliyor...
echo.

echo ========================================
echo   RENDER GIRIS GEREKLI
echo ========================================
echo.
echo Render hesabinizla giris yapmaniz gerekiyor.
echo.
echo 1. https://render.com adresine gidin
echo 2. "Sign Up" butonuna tiklayin
echo 3. GitHub hesabinizla giris yapin (sefabulut143-alt)
echo 4. "New +" butonuna tiklayin
echo 5. "Web Service" secin
echo 6. "Connect a repository" secin
echo 7. "yatirim-tesvik-arama" repo'sunu secin
echo 8. Name: "yatirim-tesvik-arama"
echo 9. Environment: "Python 3"
echo 10. Build Command: "pip install -r requirements.txt"
echo 11. Start Command: "gunicorn app:app"
echo 12. "Create Web Service" butonuna tiklayin
echo.
echo Deployment tamamlandiktan sonra bu pencereye donun
echo ve herhangi bir tusa basin.
echo.
pause

echo.
echo ========================================
echo   BASARILI!
echo ========================================
echo.
echo Her sey tamamlandi!
echo.
echo ========================================
echo   SITEYE GIRIS
echo ========================================
echo.
echo Render'da deployment tamamlandiktan sonra:
echo 1. Render dashboard'da projenizi acin
echo 2. "Deployments" sekmesine gidin
echo 3. "View" butonuna tiklayin
echo 4. Site URL'sini kopyalayin
echo 5. Bu URL'yi mobil cihazlarınızda kullanın
echo.
echo ========================================
echo   AVANTAJLAR
echo ========================================
echo.
echo ✅ 7/24 erisim
echo ✅ Bilgisayar acik kalmasina gerek yok
echo ✅ Global erisim
echo ✅ Otomatik SSL
echo ✅ Ucretsiz
echo ✅ Mobil uyumlu
echo ✅ PWA destegi
echo ✅ Sinirsiz kullanım
echo.
echo ========================================
echo   KULLANIM
echo ========================================
echo.
echo 1. Siteye girin
echo 2. Arama yapin
echo 3. Sonuclari gorun
echo 4. Mobil cihazlarda PWA olarak indirin
echo.
pause
