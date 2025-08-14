# 📱 Mobil Uyumlu Yatırım Teşvik Belgesi Arama

## 🚀 Hızlı Başlangıç

### 1. Uygulamayı Başlatın
```bash
python app.py
```

### 2. Tarayıcıda Açın
```
http://localhost:5000
```

### 3. Mobil Cihazdan Erişim
- Aynı WiFi ağında olduğunuzdan emin olun
- Bilgisayarınızın IP adresini öğrenin: `ipconfig` (Windows)
- Mobil tarayıcıda şu adresi açın: `http://[BILGISAYAR_IP]:5000`

## 📱 Mobil Özellikler

### ✅ PWA (Progressive Web App)
- **Ana Ekrana Ekle**: Telefona native app gibi indirin
- **Offline Çalışma**: İnternet olmadan da kullanın
- **Hızlı Açılış**: Cache sayesinde anında yüklenir

### ✅ Mobil Optimizasyonlar
- **Touch-Friendly**: Dokunmatik ekranlar için optimize
- **Responsive Design**: Tüm ekran boyutlarına uyum
- **iOS/Android**: Her iki platformda mükemmel çalışır
- **Zoom Prevention**: iOS'ta zoom sorunu yok

### ✅ Kullanıcı Deneyimi
- **Gerçek Zamanlı Arama**: Yazarken sonuçları görün
- **Tek Tıkla Kopyalama**: Sonuçları kolayca kopyalayın
- **Karanlık/Aydınlık Tema**: Göz yorgunluğunu azaltın
- **Hızlı Yükleme**: Optimize edilmiş performans

## 🔧 Teknik Detaylar

### Backend
- **Flask**: Python web framework
- **Pandas**: Veri işleme
- **PyArrow**: Parquet dosya desteği

### Frontend
- **HTML5**: Modern web standartları
- **Tailwind CSS**: Responsive tasarım
- **Vanilla JS**: Hızlı ve hafif
- **PWA**: Service Worker + Manifest

## 📊 Veri
- **Kaynak**: 2009-2023_aralık_ytb_listeleri.parquet
- **Format**: Sıkıştırılmış, hızlı erişim
- **Güncelleme**: 2023 Aralık

## 🌐 Deployment Seçenekleri

### 1. Lokal Kullanım
```bash
python app.py
```

### 2. Production Sunucu
```bash
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### 3. Docker
```bash
docker build -t ytb-arama .
docker run -p 5000:5000 ytb-arama
```

## 📱 Test Edilen Cihazlar

### iOS
- ✅ iPhone (Safari)
- ✅ iPad (Safari)
- ✅ iOS 14+ uyumlu

### Android
- ✅ Samsung Galaxy (Chrome)
- ✅ Google Pixel (Chrome)
- ✅ Android 10+ uyumlu

### Desktop
- ✅ Chrome, Firefox, Safari, Edge
- ✅ Windows, macOS, Linux

## 🎯 Mobil Kullanım Senaryoları

### Sahada Kullanım
- **Müşteri Ziyaretleri**: Anında belge kontrolü
- **Toplantılar**: Hızlı bilgi erişimi
- **Seyahat**: Offline çalışma

### Ofis Kullanımı
- **Masaüstü**: Tam ekran deneyimi
- **Tablet**: Dokunmatik optimizasyon
- **Telefon**: Hızlı arama

## 🔒 Güvenlik

### Production'da Gerekli
- **HTTPS**: SSL sertifikası
- **Firewall**: Port güvenliği
- **Rate Limiting**: API koruması

### Lokal Kullanım
- **Güvenli**: Sadece yerel ağ
- **Hızlı**: Düşük gecikme
- **Basit**: Kurulum gerektirmez

## 📞 Destek

### İletişim
- **Website**: www.atlasnestor.com
- **Email**: info@atlasnestor.com
- **Developer**: Sefa Bulut

### Sorun Giderme
1. **Bağlantı Sorunu**: IP adresini kontrol edin
2. **Yavaş Yükleme**: Cache'i temizleyin
3. **PWA Sorunu**: Tarayıcıyı güncelleyin
4. **Arama Sorunu**: En az 2 karakter yazın

---

**Not**: Bu uygulama orijinal desktop uygulamasının modern web versiyonudur. Aynı veri setini kullanır ancak mobil cihazlar için optimize edilmiştir.

