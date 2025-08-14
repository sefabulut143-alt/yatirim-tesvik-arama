@echo off
title Git Kullanici Konfigurasyonu - Yatirim Tesvik Belgesi Arama
color 0C

echo.
echo ========================================
echo   GIT KULLANICI KONFIGURASYONU
echo ========================================
echo.
echo Git kullanici bilgilerinizi tanimlayalim.
echo.

:: Git kullanıcı adını ayarla
echo Git kullanici adi ayarlaniyor...
git config --global user.name "sefabulut143"
if %errorlevel% neq 0 (
    echo Kullanici adi ayarlama hatasi!
    pause
    exit /b 1
)

:: Git email adresini ayarla
echo Git email adresi ayarlaniyor...
git config --global user.email "sefabulut143@gmail.com"
if %errorlevel% neq 0 (
    echo Email ayarlama hatasi!
    pause
    exit /b 1
)

echo.
echo ========================================
echo   KONFIGURASYON TAMAMLANDI
echo ========================================
echo.
echo Git kullanici bilgileri ayarlandi:
echo Kullanici adi: sefabulut143
echo Email: sefabulut143@gmail.com
echo.

:: Konfigürasyonu kontrol et
echo Konfigurasyon kontrol ediliyor...
git config --global user.name
git config --global user.email

echo.
echo ========================================
echo   GITHUB REPO OLUSTURMA
echo ========================================
echo.
echo Simdi GitHub'da repo olusturalim:
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
echo   BASARILI!
echo ========================================
echo.
echo Git konfigurasyonu tamamlandi ve ilk commit yapildi!
echo.
echo ========================================
echo   SONRAKI ADIMLAR
echo ========================================
echo.
echo 1. https://github.com adresine gidin
echo 2. Kullanici adi: sefabulut143
echo 3. Sifre: rotseN062025!
echo 4. Sag ustteki "+" butonuna tiklayin
echo 5. "New repository" secin
echo 6. Repository name: yatirim-tesvik-arama
echo 7. Description: Yatirim Tesvik Belgesi Arama Uygulamasi
echo 8. Public secin
echo 9. "Create repository" butonuna tiklayin
echo.
echo ========================================
echo   OTOMATIK GITHUB YUKLEME
echo ========================================
echo.
echo GitHub'da repo olusturduktan sonra:
echo.
echo git remote add origin https://github.com/sefabulut143/yatirim-tesvik-arama.git
echo git push -u origin main
echo.
echo ========================================
echo   HAZIR!
echo ========================================
echo.
echo Repo olusturulduktan sonra Railway'de deploy edebilirsiniz.
echo.
pause
