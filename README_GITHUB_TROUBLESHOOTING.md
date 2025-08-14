# 🔧 GitHub Sorun Giderme Kılavuzu

## 🚨 **Mevcut Sorunlar**

### 1. **Ağ Bağlantısı Sorunu**
```
fatal: Uzak ad çözülemedi: 'api.github.com'
```

### 2. **Kimlik Doğrulama Sorunu**
```
info: please complete authentication in your browser...
```

## 🔧 **Çözümler**

### **Çözüm 1: GitHub Personal Access Token**

GitHub artık şifre ile değil, Personal Access Token ile çalışıyor.

#### **Token Oluşturma:**
1. https://github.com adresine gidin
2. **Kullanıcı adı**: `sefabulut143-alt`
3. **Şifre**: `rotseN062025!`
4. Sağ üstteki profil resminize tıklayın
5. "Settings" seçin
6. Sol menüde "Developer settings" seçin
7. "Personal access tokens" seçin
8. "Tokens (classic)" seçin
9. "Generate new token" seçin
10. "Generate new token (classic)" seçin
11. **Note**: "Yatirim Tesvik Arama Token"
12. **Expiration**: "No expiration"
13. **Scopes**: "repo" kutusunu işaretleyin
14. "Generate token" butonuna tıklayın
15. **Token'i kopyalayın** ve güvenli bir yere kaydedin

#### **Token ile Push:**
```bash
git remote add origin https://sefabulut143-alt@github.com/sefabulut143-alt/yatirim-tesvik-arama.git
git push -u origin main
# Şifre olarak token'i girin
```

### **Çözüm 2: Ağ Bağlantısı Sorunu**

#### **DNS Cache Temizleme:**
```bash
ipconfig /flushdns
```

#### **Alternatif DNS Ayarları:**
- Google DNS: 8.8.8.8, 8.8.4.4
- Cloudflare DNS: 1.1.1.1, 1.0.0.1

#### **Firewall Kontrolü:**
- Windows Firewall'da Git'e izin verin
- Antivirüs programında Git'i güvenilir olarak işaretleyin

### **Çözüm 3: Manuel GitHub Yükleme**

Ağ sorunu varsa manuel olarak yükleyin:

1. https://github.com/sefabulut143-alt/yatirim-tesvik-arama adresine gidin
2. "Add file" > "Upload files" seçin
3. Tüm dosyaları seçin ve yükleyin
4. "Commit changes" butonuna tıklayın

## 🚀 **Hazır Scriptler**

### **Token Setup:**
```bash
github_token_setup.bat
```

### **Ağ Sorunu Çözümü:**
```bash
network_fix.bat
```

## 📋 **Manuel Komutlar**

### **Git Konfigürasyonu:**
```bash
git config --global user.name "sefabulut143-alt"
git config --global user.email "sefabulut143@gmail.com"
```

### **Branch Yeniden Adlandırma:**
```bash
git branch -M main
```

### **Remote Ayarlama:**
```bash
git remote remove origin
git remote add origin https://github.com/sefabulut143-alt/yatirim-tesvik-arama.git
```

### **Push:**
```bash
git push -u origin main
```

## 🌟 **Alternatif Çözümler**

### **SSH Key Kullanımı:**
```bash
# SSH key oluştur
ssh-keygen -t ed25519 -C "sefabulut143@gmail.com"

# SSH key'i GitHub'a ekle
# Settings > SSH and GPG keys > New SSH key
```

### **GitHub Desktop:**
1. GitHub Desktop indirin
2. GitHub hesabınızla giriş yapın
3. Repo'yu klonlayın
4. Dosyaları ekleyin ve commit edin
5. Push edin

## 🎯 **Sonraki Adımlar**

### **GitHub Repo Oluşturulduktan Sonra:**
1. **Railway'de Deploy**: https://railway.app
2. **Render'da Deploy**: https://render.com
3. **Vercel'de Deploy**: https://vercel.com

### **Deployment Avantajları:**
- ✅ **7/24 erişim** - Bilgisayar kapalı olsa bile
- ✅ **Global erişim** - Dünyanın her yerinden
- ✅ **Otomatik SSL** - Güvenli bağlantı
- ✅ **Yüksek performans** - Hızlı yükleme

## 🆘 **Destek**

### **İletişim:**
- **Website**: www.atlasnestor.com
- **Email**: info@atlasnestor.com
- **Developer**: Sefa Bulut

### **Faydalı Linkler:**
- GitHub: https://github.com
- GitHub Token: https://github.com/settings/tokens
- Railway: https://railway.app

---

## 🎉 **Sonuç**

Bu sorunları çözdükten sonra:
- **GitHub repo oluşturabilirsiniz**
- **Cloud deployment yapabilirsiniz**
- **7/24 erişim sağlayabilirsiniz**
- **Bilgisayarınızı kapatabilirsiniz**

**Not**: `github_token_setup.bat` ve `network_fix.bat` dosyalarını kullanarak sorunları çözebilirsiniz.
