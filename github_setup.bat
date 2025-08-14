@echo off
title GitHub Repo Olusturma - Yatirim Tesvik Belgesi Arama
color 0B

echo.
echo ========================================
echo   GITHUB REPO OLUSTURMA
echo ========================================
echo.
echo Bu script GitHub'da repo olusturmaniza yardim eder.
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

echo.
echo ========================================
echo   GITHUB'DA REPO OLUSTURUN
echo ========================================
echo.
echo 1. https://github.com adresine gidin
echo 2. Hesabinizla giris yapin
echo 3. Sag ustteki "+" butonuna tiklayin
echo 4. "New repository" secin
echo 5. Repository name: yatirim-tesvik-arama
echo 6. Description: Yatirim Tesvik Belgesi Arama Uygulamasi
echo 7. Public secin
echo 8. "Create repository" butonuna tiklayin
echo.
echo ========================================
echo   REPO OLUSTURULDUKTAN SONRA
echo ========================================
echo.
echo GitHub'da repo olusturduktan sonra asagidaki komutlari calistirin:
echo.
echo git remote add origin https://github.com/KULLANICI_ADINIZ/yatirim-tesvik-arama.git
echo git push -u origin main
echo.
echo ========================================
echo   OTOMATIK KOMUT CALISTIRMA
echo ========================================
echo.
set /p github_user="GitHub kullanici adinizi girin: "
if "%github_user%"=="" (
    echo Kullanici adi girilmedi!
    pause
    exit /b 1
)

echo.
echo GitHub kullanici adiniz: %github_user%
echo.
set /p confirm="Devam etmek istiyor musunuz? (y/n): "
if /i not "%confirm%"=="y" (
    echo Iptal edildi.
    pause
    exit /b 1
)

:: Remote ekle
echo Remote ekleniyor...
git remote add origin https://github.com/%github_user%/yatirim-tesvik-arama.git
if %errorlevel% neq 0 (
    echo Remote ekleme hatasi! Repo olusturulmus mu kontrol edin.
    pause
    exit /b 1
)

:: Push
echo GitHub'a yukleniyor...
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
echo Repo URL: https://github.com/%github_user%/yatirim-tesvik-arama
echo.
echo ========================================
echo   SONRAKI ADIM: RAILWAY DEPLOY
echo ========================================
echo.
echo 1. https://railway.app adresine gidin
echo 2. GitHub hesabinizla giris yapin
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
pause
