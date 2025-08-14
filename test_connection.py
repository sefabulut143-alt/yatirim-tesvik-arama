import requests
import time
import sys

def test_local_connection():
    """Yerel bağlantıyı test et"""
    try:
        response = requests.get('http://localhost:5000', timeout=5)
        if response.status_code == 200:
            print("✅ Yerel bağlantı başarılı!")
            print(f"📊 Durum kodu: {response.status_code}")
            return True
        else:
            print(f"❌ Bağlantı hatası: {response.status_code}")
            return False
    except requests.exceptions.ConnectionError:
        print("❌ Flask uygulaması çalışmıyor!")
        print("💡 Önce 'python app.py' komutunu çalıştırın")
        return False
    except Exception as e:
        print(f"❌ Test hatası: {e}")
        return False

def test_api_endpoints():
    """API endpoint'lerini test et"""
    try:
        # Stats endpoint test
        response = requests.get('http://localhost:5000/api/stats', timeout=5)
        if response.status_code == 200:
            data = response.json()
            print(f"✅ API Stats çalışıyor!")
            print(f"📊 Toplam kayıt: {data.get('total_records', 'Bilinmiyor')}")
        else:
            print(f"❌ Stats API hatası: {response.status_code}")
            return False
        
        # Search endpoint test
        response = requests.get('http://localhost:5000/api/search?q=test', timeout=5)
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Arama API çalışıyor!")
            print(f"🔍 Test araması sonucu: {data.get('count', 0)} sonuç")
        else:
            print(f"❌ Search API hatası: {response.status_code}")
            return False
            
        return True
        
    except Exception as e:
        print(f"❌ API test hatası: {e}")
        return False

def main():
    print("🔍 Bağlantı Testi")
    print("=" * 30)
    
    # Yerel bağlantıyı test et
    if not test_local_connection():
        return False
    
    print()
    
    # API endpoint'lerini test et
    if not test_api_endpoints():
        return False
    
    print()
    print("🎉 Tüm testler başarılı!")
    print("📱 Uygulama mobil erişime hazır!")
    print()
    print("🌐 Mobil erişim için:")
    print("1. start_mobile.bat dosyasını çalıştırın")
    print("2. Veya manuel olarak tünel kurun")
    
    return True

if __name__ == "__main__":
    success = main()
    if not success:
        sys.exit(1)
