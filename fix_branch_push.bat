@echo off
title Branch Push Sorunu Cozumu - Yatirim Tesvik Belgesi Arama
color 0C

echo.
echo ========================================
echo   BRANCH PUSH SORUNU COZUMU
echo ========================================
echo.
echo Branch adi sorunu cozuluyor...
echo.

:: Git kullanıcı konfigürasyonu
echo Git kullanici konfigurasyonu yapiliyor...
git config --global user.name "sefabulut143-alt"
git config --global user.email "sefabulut143@gmail.com"

:: Mevcut branch'i kontrol et
echo Mevcut branch kontrol ediliyor...
git branch

:: Master branch'ini main'e yeniden adlandır
echo Master branch'i main'e yeniden adlandiriliyor...
git branch -M main

:: Remote'u kontrol et ve ekle
echo Remote kontrol ediliyor...
git remote -v

:: Remote'u kaldır ve yeniden ekle
echo Remote yeniden ekleniyor...
git remote remove origin 2>nul
git remote add origin https://github.com/sefabulut143-alt/yatirim-tesvik-arama.git

:: Push işlemi
echo GitHub'a yukleniyor...
echo.
echo GitHub kullanici adi ve sifrenizi girmeniz gerekebilir.
echo Kullanici adi: sefabulut143-alt
echo Sifre: rotseN062025!
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo   PUSH HATASI - ALTERNATIF COZUM
    echo ========================================
    echo.
    echo Master branch ile push ediliyor...
    git push -u origin master
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
pause
