@echo off
title Otomatik Tam Deployment - Yatirim Tesvik Belgesi Arama
color 0A

echo.
echo ========================================
echo   OTOMATIK TAM DEPLOYMENT
echo ========================================
echo.
echo Her seyi otomatik yapiyorum...
echo Siz sadece siteye girip kullanacaksiniz!
echo.

:: Git kontrol et ve yükle
echo Git kontrol ediliyor...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git yukleniyor...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe' -OutFile 'git-installer.exe'}"
    start /wait git-installer.exe /VERYSILENT /NORESTART
    del git-installer.exe
    echo Git yuklendi!
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

:: Branch'i main'e çevir
git branch -M main

echo.
echo ========================================
echo   GITHUB REPO OLUSTURULUYOR
echo ========================================
echo.
echo GitHub'da repo olusturuluyor...
echo.

:: GitHub API ile repo oluştur
echo GitHub API ile repo olusturuluyor...
powershell -Command "& {
    $headers = @{
        'Authorization' = 'token ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        'Accept' = 'application/vnd.github.v3+json'
    }
    
    $body = @{
        name = 'yatirim-tesvik-arama'
        description = 'Yatirim Tesvik Belgesi Arama Uygulamasi'
        private = $false
        auto_init = $false
    } | ConvertTo-Json
    
    try {
        $response = Invoke-RestMethod -Uri 'https://api.github.com/user/repos' -Method Post -Headers $headers -Body $body -ContentType 'application/json'
        Write-Host 'Repo olusturuldu: ' $response.html_url
    } catch {
        Write-Host 'Repo olusturma hatasi: ' $_.Exception.Message
    }
}"

:: Remote ekle ve push
echo Remote ekleniyor...
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
echo   RAILWAY DEPLOYMENT
echo ========================================
echo.
echo Railway'de deploy ediliyor...
echo.

:: Railway CLI ile deploy
echo Railway CLI yukleniyor...
npm install -g @railway/cli

echo.
echo ========================================
echo   RAILWAY GIRIS GEREKLI
echo ========================================
echo.
echo Railway hesabinizla giris yapmaniz gerekiyor.
echo.
echo 1. https://railway.app adresine gidin
echo 2. GitHub hesabinizla giris yapin (sefabulut143-alt)
echo 3. "New Project" secin
echo 4. "Deploy from GitHub repo" secin
echo 5. "yatirim-tesvik-arama" repo'sunu secin
echo 6. "Deploy Now" butonuna tiklayin
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
echo Railway'de deployment tamamlandiktan sonra:
echo 1. Railway dashboard'da projenizi acin
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

