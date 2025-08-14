import subprocess
import requests
import time
import os
import sys

def install_ngrok():
    """Ngrok'u otomatik olarak indir ve kur"""
    print("🔧 Ngrok kurulumu başlatılıyor...")
    
    # Ngrok'u indir
    ngrok_url = "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip"
    
    try:
        import urllib.request
        print("📥 Ngrok indiriliyor...")
        urllib.request.urlretrieve(ngrok_url, "ngrok.zip")
        
        # Zip'i çıkart
        import zipfile
        with zipfile.ZipFile("ngrok.zip", 'r') as zip_ref:
            zip_ref.extractall(".")
        
        # Zip dosyasını sil
        os.remove("ngrok.zip")
        print("✅ Ngrok başarıyla kuruldu!")
        return True
    except Exception as e:
        print(f"❌ Ngrok kurulum hatası: {e}")
        return False

def start_ngrok_tunnel(port=5000):
    """Ngrok tüneli başlat"""
    print(f"🚀 Ngrok tüneli başlatılıyor (port: {port})...")
    
    try:
        # Ngrok'u başlat
        process = subprocess.Popen(
            ["./ngrok", "http", str(port)],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        # Tünel URL'sini al
        time.sleep(3)
        try:
            response = requests.get("http://localhost:4040/api/tunnels")
            tunnels = response.json()["tunnels"]
            if tunnels:
                public_url = tunnels[0]["public_url"]
                print(f"✅ Tünel başarıyla oluşturuldu!")
                print(f"🌐 Mobil erişim URL'si: {public_url}")
                print(f"📱 Bu URL'yi mobil cihazınızda açabilirsiniz")
                print(f"🔒 Tünel güvenli (HTTPS) ve şifreli")
                return public_url, process
        except:
            print("⚠️ Tünel URL'si alınamadı, manuel kontrol gerekli")
            return None, process
            
    except Exception as e:
        print(f"❌ Tünel başlatma hatası: {e}")
        return None, None

def main():
    print("🌐 Mobil Erişim Kurulumu")
    print("=" * 40)
    
    # Ngrok kurulu mu kontrol et
    if not os.path.exists("ngrok.exe") and not os.path.exists("./ngrok"):
        print("📦 Ngrok kurulu değil, kurulum başlatılıyor...")
        if not install_ngrok():
            print("❌ Ngrok kurulumu başarısız!")
            return
    
    # Tüneli başlat
    url, process = start_ngrok_tunnel(5000)
    
    if url:
        print("\n📋 Kullanım Talimatları:")
        print("1. Mobil cihazınızda tarayıcıyı açın")
        print(f"2. Bu adresi girin: {url}")
        print("3. Uygulamayı kullanmaya başlayın!")
        print("\n⚠️ Not: Bu tünel geçicidir ve bilgisayarınız kapandığında kapanır")
        print("🛑 Durdurmak için Ctrl+C tuşlayın")
        
        try:
            process.wait()
        except KeyboardInterrupt:
            print("\n🛑 Tünel kapatılıyor...")
            process.terminate()
    else:
        print("❌ Tünel başlatılamadı!")

if __name__ == "__main__":
    main()

