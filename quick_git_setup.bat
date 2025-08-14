@echo off
title Hizli Git Setup - Yatirim Tesvik Belgesi Arama
color 0A

echo.
echo ========================================
echo   HIZLI GIT SETUP
echo ========================================
echo.
echo Git yukleniyor ve GitHub'a yukleniyor...
echo.

:: Git'i indir ve kur
echo Git indiriliyor...
powershell -Command "& {Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe' -OutFile 'git-installer.exe'}"
echo Git indirildi. Kurulum basliyor...
echo.

:: Kurulumu başlat
start /wait git-installer.exe /VERYSILENT /NORESTART

echo.
echo Git kurulumu tamamlandi!
echo.

:: Kurulum dosyasını sil
del git-installer.exe

:: Git kullanıcı konfigürasyonu
echo Git kullanici konfigurasyonu yapiliyor...
git config --global user.name "sefabulut143"
git config --global user.email "sefabulut143@gmail.com"

echo.
echo ========================================
echo   GITHUB'DA REPO OLUSTURUN
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
echo   REPO OLUSTURULDUKTAN SONRA
echo ========================================
echo.
echo GitHub'da repo olusturduktan sonra bu pencereye donun
echo ve herhangi bir tusa basin.
echo.
pause

:: Git repo durumunu kontrol et
echo Git repo durumu kontrol ediliyor...
git status

:: Eğer repo yoksa başlat
if not exist ".git" (
    echo Git repo baslatiliyor...
    git init
)

:: Dosyaları ekle (eğer değişiklik varsa)
echo Dosyalar ekleniyor...
git add .

:: Commit yap (eğer değişiklik varsa)
echo Commit kontrol ediliyor...
git diff --cached --quiet
if %errorlevel% neq 0 (
    echo Yeni değişiklikler commit ediliyor...
    git commit -m "Update - Yatirim Tesvik Belgesi Arama"
) else (
    echo Zaten commit edilmis.
)

:: Remote ekle
echo Remote ekleniyor...
git remote remove origin 2>nul
git remote add origin https://github.com/sefabulut143/yatirim-tesvik-arama.git

:: Push
echo GitHub'a yukleniyor...
echo.
echo GitHub kullanici adi ve sifrenizi girmeniz gerekebilir.
echo Kullanici adi: sefabulut143
echo Sifre: rotseN062025!
echo.
git push -u origin main

echo.
echo ========================================
echo   BASARILI!
echo ========================================
echo.
echo GitHub repo olusturuldu ve dosyalar yuklendi!
echo.
echo Repo URL: https://github.com/sefabulut143/yatirim-tesvik-arama
echo.
echo ========================================
echo   SONRAKI ADIM: RAILWAY DEPLOY
echo ========================================
echo.
echo 1. https://railway.app adresine gidin
echo 2. GitHub hesabinizla giris yapin (sefabulut143)
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
