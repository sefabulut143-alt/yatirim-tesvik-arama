@echo off
title GitHub Token Setup - Yatirim Tesvik Belgesi Arama
color 0E

echo.
echo ========================================
echo   GITHUB PERSONAL ACCESS TOKEN SETUP
echo ========================================
echo.
echo GitHub artik sifre ile degil, token ile calisiyor.
echo Token olusturalim...
echo.

echo ========================================
echo   GITHUB'DA TOKEN OLUSTURUN
echo ========================================
echo.
echo 1. https://github.com adresine gidin
echo 2. Kullanici adi: sefabulut143-alt
echo 3. Sifre: rotseN062025!
echo 4. Sag ustteki profil resminize tiklayin
echo 5. "Settings" secin
echo 6. Sol menude "Developer settings" secin
echo 7. "Personal access tokens" secin
echo 8. "Tokens (classic)" secin
echo 9. "Generate new token" secin
echo 10. "Generate new token (classic)" secin
echo 11. Note: "Yatirim Tesvik Arama Token"
echo 12. Expiration: "No expiration"
echo 13. Scopes: "repo" kutusunu isaretleyin
echo 14. "Generate token" butonuna tiklayin
echo 15. Token'i kopyalayin ve guvenli bir yere kaydedin
echo.
echo ========================================
echo   TOKEN OLUSTURULDUKTAN SONRA
echo ========================================
echo.
echo Token'i aldiktan sonra bu pencereye donun
echo ve herhangi bir tusa basin.
echo.
pause

:: Git kullanıcı konfigürasyonu
echo Git kullanici konfigurasyonu yapiliyor...
git config --global user.name "sefabulut143-alt"
git config --global user.email "sefabulut143@gmail.com"

:: Remote'u token ile ayarla
echo Remote token ile ayarlaniyor...
git remote remove origin 2>nul
git remote add origin https://sefabulut143-alt@github.com/sefabulut143-alt/yatirim-tesvik-arama.git

:: Push işlemi
echo GitHub'a yukleniyor...
echo.
echo GitHub token'inizi girmeniz gerekecek.
echo Sifre olarak token'i girin.
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
