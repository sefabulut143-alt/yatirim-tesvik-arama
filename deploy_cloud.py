import os
import sys
import json

def create_heroku_files():
    """Heroku deployment dosyaları oluştur"""
    print("🚀 Heroku Deployment Dosyaları Oluşturuluyor...")
    
    # Procfile
    with open("Procfile", "w") as f:
        f.write("web: gunicorn app:app")
    
    # runtime.txt
    with open("runtime.txt", "w") as f:
        f.write("python-3.9.18")
    
    # requirements.txt güncelle
    requirements = """Flask>=2.0.0
pandas>=1.5.0
pyarrow>=10.0.0
requests>=2.25.0
gunicorn>=20.1.0
"""
    
    with open("requirements.txt", "w") as f:
        f.write(requirements)
    
    print("✅ Heroku dosyaları oluşturuldu!")

def create_railway_files():
    """Railway deployment dosyaları oluştur"""
    print("🚂 Railway Deployment Dosyaları Oluşturuluyor...")
    
    # railway.json
    railway_config = {
        "build": {
            "builder": "nixpacks"
        },
        "deploy": {
            "startCommand": "gunicorn app:app",
            "healthcheckPath": "/",
            "healthcheckTimeout": 300,
            "restartPolicyType": "on_failure"
        }
    }
    
    with open("railway.json", "w") as f:
        json.dump(railway_config, f, indent=2)
    
    print("✅ Railway dosyaları oluşturuldu!")

def create_render_files():
    """Render deployment dosyaları oluştur"""
    print("🎨 Render Deployment Dosyaları Oluşturuluyor...")
    
    # render.yaml
    render_config = """services:
  - type: web
    name: ytb-arama
    env: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    envVars:
      - key: PYTHON_VERSION
        value: 3.9.18
"""
    
    with open("render.yaml", "w") as f:
        f.write(render_config)
    
    print("✅ Render dosyaları oluşturuldu!")

def create_dockerfile():
    """Docker dosyası oluştur"""
    print("🐳 Docker Dosyası Oluşturuluyor...")
    
    dockerfile = """FROM python:3.9-slim

WORKDIR /app

# Bağımlılıkları kopyala ve yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . .

# Port'u aç
EXPOSE 5000

# Uygulamayı başlat
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
"""
    
    with open("Dockerfile", "w") as f:
        f.write(dockerfile)
    
    print("✅ Dockerfile oluşturuldu!")

def create_deployment_guide():
    """Deployment kılavuzu oluştur"""
    print("📋 Deployment Kılavuzu Oluşturuluyor...")
    
    guide = """# 🌐 Cloud Deployment Kılavuzu

## 🚀 Ücretsiz Cloud Platformları

### 1. **Railway** (En Kolay)
- **URL**: https://railway.app
- **Avantajlar**: Ücretsiz, kolay kurulum, otomatik SSL
- **Adımlar**:
  1. Railway hesabı oluşturun
  2. GitHub'a projeyi yükleyin
  3. Railway'de "Deploy from GitHub" seçin
  4. Otomatik olarak deploy edilir

### 2. **Render** (Güvenilir)
- **URL**: https://render.com
- **Avantajlar**: Ücretsiz tier, güvenilir, hızlı
- **Adımlar**:
  1. Render hesabı oluşturun
  2. "New Web Service" seçin
  3. GitHub repo'nuzu bağlayın
  4. Build ve deploy otomatik

### 3. **Heroku** (Klasik)
- **URL**: https://heroku.com
- **Avantajlar**: Güvenilir, geniş ekosistem
- **Not**: Artık ücretsiz tier yok

### 4. **Vercel** (Hızlı)
- **URL**: https://vercel.com
- **Avantajlar**: Çok hızlı, otomatik SSL
- **Adımlar**: GitHub repo'yu bağlayın

## 📦 Manuel Deployment

### GitHub'a Yükleme
```bash
# Git repo oluştur
git init
git add .
git commit -m "Initial commit"

# GitHub'a push
git remote add origin https://github.com/kullaniciadi/repo-adi.git
git push -u origin main
```

### Railway Deployment
1. railway.json dosyası otomatik oluşturuldu
2. GitHub'a yükleyin
3. Railway'de deploy edin

### Render Deployment
1. render.yaml dosyası otomatik oluşturuldu
2. GitHub'a yükleyin
3. Render'da deploy edin

## 🔧 Önemli Notlar

### Veri Dosyası
- Parquet dosyası büyük olabilir
- Cloud platformları dosya boyutu sınırı olabilir
- Alternatif: Veriyi ayrı bir serviste tutun

### Environment Variables
- Hassas bilgileri environment variable olarak saklayın
- API key'leri güvenli şekilde yönetin

### Monitoring
- Cloud platformlarının monitoring özelliklerini kullanın
- Log'ları takip edin

## 🌍 Avantajlar

### Cloud Deployment
- ✅ 7/24 erişim
- ✅ Bilgisayar açık kalması gerekmez
- ✅ Otomatik SSL sertifikası
- ✅ Yüksek performans
- ✅ Otomatik backup

### Lokal vs Cloud
| Özellik | Lokal | Cloud |
|---------|-------|-------|
| Maliyet | Ücretsiz | Ücretsiz* |
| Erişim | Sınırlı | Global |
| Bakım | Manuel | Otomatik |
| Güvenlik | Temel | Gelişmiş |

*Çoğu platform ücretsiz tier sunar

## 🆘 Sorun Giderme

### Build Hataları
- requirements.txt dosyasını kontrol edin
- Python versiyonunu kontrol edin
- Log'ları inceleyin

### Runtime Hataları
- Environment variables'ları kontrol edin
- Port ayarlarını kontrol edin
- Veri dosyası yolunu kontrol edin

---
**Not**: Cloud deployment ile uygulamanız 7/24 erişilebilir olur!
"""
    
    with open("DEPLOYMENT_GUIDE.md", "w", encoding="utf-8") as f:
        f.write(guide)
    
    print("✅ Deployment kılavuzu oluşturuldu!")

def main():
    print("🌐 Cloud Deployment Kurulumu")
    print("=" * 40)
    print()
    
    print("Hangi platform için dosya oluşturmak istiyorsunuz?")
    print("1. Railway (Önerilen)")
    print("2. Render")
    print("3. Heroku")
    print("4. Docker")
    print("5. Hepsi")
    print("6. Çıkış")
    
    choice = input("\nSeçiminizi yapın (1-6): ")
    
    if choice == "1":
        create_railway_files()
    elif choice == "2":
        create_render_files()
    elif choice == "3":
        create_heroku_files()
    elif choice == "4":
        create_dockerfile()
    elif choice == "5":
        create_railway_files()
        create_render_files()
        create_heroku_files()
        create_dockerfile()
        create_deployment_guide()
    elif choice == "6":
        print("Çıkış yapılıyor...")
        return
    else:
        print("Geçersiz seçim!")
        return
    
    print("\n🎉 Deployment dosyaları hazır!")
    print("📋 DEPLOYMENT_GUIDE.md dosyasını okuyun")
    print("🌐 Cloud platformunda deploy edin")

if __name__ == "__main__":
    main()
