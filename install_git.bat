@echo off
title Git Kurulumu - Yatirim Tesvik Belgesi Arama
color 0A

echo.
echo ========================================
echo   GIT KURULUMU
echo ========================================
echo.
echo Git yukleniyor...
echo.

:: Git'i indir ve kur
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

echo.
echo ========================================
echo   GITHUB REPO OLUSTURMA
echo ========================================
echo.
echo Simdi GitHub'da repo olusturalim:
echo.

:: Git'i başlat
git init
git add .
git commit -m "Initial commit - Yatirim Tesvik Belgesi Arama"

echo.
echo ========================================
echo   SONRAKI ADIMLAR
echo ========================================
echo.
echo 1. https://github.com adresine gidin
echo 2. Hesabinizla giris yapin
echo 3. "New repository" butonuna tiklayin
echo 4. Repo adi: yatirim-tesvik-arama
echo 5. "Create repository" butonuna tiklayin
echo 6. Asagidaki komutlari calistirin:
echo.
echo git remote add origin https://github.com/KULLANICI_ADINIZ/yatirim-tesvik-arama.git
echo git push -u origin main
echo.
echo ========================================
echo   HAZIR!
echo ========================================
echo.
echo Repo olusturulduktan sonra Railway'de deploy edebilirsiniz.
echo.
pause

