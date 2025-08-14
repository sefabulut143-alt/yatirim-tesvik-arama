@echo off
title Tam GitHub Setup - Yatirim Tesvik Belgesi Arama
color 0E

echo.
echo ========================================
echo   TAM GITHUB SETUP
echo ========================================
echo.
echo Bu script tum islemleri otomatik yapar.
echo.

:: Git kontrol et
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git yuklu degil! Once Git'i yukleyin.
    echo install_git.bat dosyasini calistirin.
    pause
    exit /b 1
)

echo Git yuklu. Devam ediliyor...
echo.

:: Git kullanıcı konfigürasyonu
echo Git kullanici konfigurasyonu yapiliyor...
git config --global user.name "sefabulut143-alt"
git config --global user.email "sefabulut143@gmail.com"

echo.
echo ========================================
echo   GITHUB'DA REPO OLUSTURUN
echo ========================================
echo.
echo 1. https://github.com adresine gidin
echo 2. Kullanici adi: sefabulut143-alt
echo 3. Sifre: rotseN062025!
echo 4. Sag ustteki "+" butonuna tiklayin
echo 5. "New repository" secin
echo 6. Repository name: yatirim-tesvik-arama
echo 7. Description: Yatirim Tesvik Belgesi Arama Uygulamasi
echo 8. Public secin
echo 9. "Create repository" butonuna tiklayin
echo.
echo ========================================
echo   REPO OLUSTURULDUKTAN SONRA
echo ========================================
echo.
echo GitHub'da repo olusturduktan sonra bu pencereye donun
echo ve herhangi bir tusa basin.
echo.
pause

:: Git repo başlat
echo Git repo baslatiliyor...
git init
if %errorlevel% neq 0 (
    echo Git repo baslatma hatasi!
    pause
    exit /b 1
)

:: Dosyaları ekle
echo Dosyalar ekleniyor...
git add .
if %errorlevel% neq 0 (
    echo Dosya ekleme hatasi!
    pause
    exit /b 1
)

:: İlk commit
echo Ilk commit yapiliyor...
git commit -m "Initial commit - Yatirim Tesvik Belgesi Arama"
if %errorlevel% neq 0 (
    echo Commit hatasi!
    pause
    exit /b 1
)

:: Remote ekle
echo Remote ekleniyor...
git remote add origin https://github.com/sefabulut143-alt/yatirim-tesvik-arama.git
if %errorlevel% neq 0 (
    echo Remote ekleme hatasi! Repo olusturulmus mu kontrol edin.
    pause
    exit /b 1
)

:: Push
echo GitHub'a yukleniyor...
echo.
echo GitHub kullanici adi ve sifrenizi girmeniz gerekebilir.
echo Kullanici adi: sefabulut143-alt
echo Sifre: rotseN062025!
echo.
git push -u origin main
if %errorlevel% neq 0 (
    echo Push hatasi! GitHub'da repo olusturulmus mu kontrol edin.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   BASARILI!
echo ========================================
echo.
echo GitHub repo olusturuldu ve dosyalar yuklendi!
echo.
echo Repo URL: https://github.com/sefabulut143-alt/yatirim-tesvik-arama
echo.
echo ========================================
echo   SONRAKI ADIM: RAILWAY DEPLOY
echo ========================================
echo.
echo 1. https://railway.app adresine gidin
echo 2. GitHub hesabinizla giris yapin (sefabulut143-alt)
echo 3. "Deploy from GitHub" secin
echo 4. yatirim-tesvik-arama repo'sunu secin
echo 5. Otomatik deploy baslar!
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
echo.
echo ========================================
echo   REPO BILGILERI
echo ========================================
echo.
echo Kullanici adi: sefabulut143-alt
echo Repo adi: yatirim-tesvik-arama
echo URL: https://github.com/sefabulut143-alt/yatirim-tesvik-arama
echo.
pause
