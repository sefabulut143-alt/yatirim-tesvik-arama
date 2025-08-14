# 🐙 GitHub Repo Oluşturma Kılavuzu

## 🎯 **GitHub'da Repo Oluşturma**

### Adım 1: Git Kurulumu
Eğer Git yüklü değilse:
1. `install_git.bat` dosyasını çalıştırın
2. Otomatik kurulum tamamlanacak

### Adım 2: GitHub'da Repo Oluşturma
1. https://github.com adresine gidin
2. Hesabınızla giriş yapın
3. Sağ üstteki "+" butonuna tıklayın
4. "New repository" seçin
5. Repository name: `yatirim-tesvik-arama`
6. Description: `Yatırım Teşvik Belgesi Arama Uygulaması`
7. Public seçin
8. "Create repository" butonuna tıklayın

### Adım 3: Otomatik Setup
1. `github_setup.bat` dosyasını çalıştırın
2. GitHub kullanıcı adınızı girin
3. Otomatik olarak repo oluşturulur ve dosyalar yüklenir

## 🚀 **Manuel Komutlar**

### Git Repo Başlatma:
```bash
git init
git add .
git commit -m "Initial commit - Yatırım Teşvik Belgesi Arama"
```

### GitHub'a Bağlama:
```bash
git remote add origin https://github.com/KULLANICI_ADINIZ/yatirim-tesvik-arama.git
git push -u origin main
```

## 📁 **Yüklenecek Dosyalar**

### Ana Dosyalar:
- ✅ `app.py` - Flask uygulaması
- ✅ `requirements.txt` - Python bağımlılıkları
- ✅ `templates/index.html` - Web arayüzü
- ✅ `static/` - CSS, JS, resimler
- ✅ `2009-2023_aralık_ytb_listeleri.parquet` - Veri dosyası

### Deployment Dosyaları:
- ✅ `railway.json` - Railway konfigürasyonu
- ✅ `render.yaml` - Render konfigürasyonu
- ✅ `Procfile` - Heroku konfigürasyonu
- ✅ `Dockerfile` - Docker konfigürasyonu
- ✅ `runtime.txt` - Python versiyonu
- ✅ `.gitignore` - Git dosyaları

## 🌟 **Avantajlar**

### GitHub Repo:
- ✅ **Versiyon kontrolü** - Değişiklikleri takip edin
- ✅ **Yedekleme** - Kodunuz güvende
- ✅ **İşbirliği** - Başkaları katkıda bulunabilir
- ✅ **Cloud deployment** - Railway, Render, Vercel entegrasyonu
- ✅ **Ücretsiz** - Sınırsız public repo

## 🔧 **Teknik Detaylar**

### Git Konfigürasyonu:
```bash
git config --global user.name "Adınız"
git config --global user.email "email@example.com"
```

### Branch Yönetimi:
```bash
git branch -M main
git checkout -b development
```

### Commit Mesajları:
```bash
git commit -m "feat: Yeni özellik eklendi"
git commit -m "fix: Hata düzeltildi"
git commit -m "docs: Dokümantasyon güncellendi"
```

## 🎯 **Sonraki Adımlar**

### GitHub Repo Oluşturulduktan Sonra:
1. **Railway'de Deploy**: https://railway.app
2. **Render'da Deploy**: https://render.com
3. **Vercel'de Deploy**: https://vercel.com

### Deployment Avantajları:
- ✅ **7/24 erişim** - Bilgisayar kapalı olsa bile
- ✅ **Global erişim** - Dünyanın her yerinden
- ✅ **Otomatik SSL** - Güvenli bağlantı
- ✅ **Yüksek performans** - Hızlı yükleme

## 🆘 **Sorun Giderme**

### Git Hataları:
1. **Git yüklü değil**: `install_git.bat` çalıştırın
2. **Authentication hatası**: GitHub token oluşturun
3. **Push hatası**: Repo oluşturulmuş mu kontrol edin

### GitHub Hataları:
1. **Repo bulunamadı**: URL'yi kontrol edin
2. **Permission hatası**: Repo public mi kontrol edin
3. **Branch hatası**: `main` branch kullanın

## 📞 **Destek**

### İletişim:
- **Website**: www.atlasnestor.com
- **Email**: info@atlasnestor.com
- **Developer**: Sefa Bulut

### Faydalı Linkler:
- GitHub: https://github.com
- Git: https://git-scm.com
- GitHub Desktop: https://desktop.github.com

---

## 🎉 **Sonuç**

GitHub repo oluşturduktan sonra:
- **Kodunuz güvende** olacak
- **Cloud deployment** yapabileceksiniz
- **7/24 erişim** sağlayabileceksiniz
- **Bilgisayarınızı kapatabileceksiniz**

**Not**: `github_setup.bat` dosyasını çalıştırarak otomatik olarak GitHub repo oluşturabilirsiniz.
