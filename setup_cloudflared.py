import subprocess
import requests
import time
import os
import sys

def install_cloudflared():
    """Cloudflared'i otomatik olarak indir ve kur"""
    print("🔧 Cloudflared kurulumu başlatılıyor...")
    
    # Windows için Cloudflared indir
    cloudflared_url = "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe"
    
    try:
        import urllib.request
        print("📥 Cloudflared indiriliyor...")
        urllib.request.urlretrieve(cloudflared_url, "cloudflared.exe")
        print("✅ Cloudflared başarıyla kuruldu!")
        return True
    except Exception as e:
        print(f"❌ Cloudflared kurulum hatası: {e}")
        return False

def start_cloudflared_tunnel(port=5000):
    """Cloudflared tüneli başlat"""
    print(f"🚀 Cloudflared tüneli başlatılıyor (port: {port})...")
    
    try:
        # Cloudflared'i başlat
        process = subprocess.Popen(
            ["cloudflared.exe", "tunnel", "--url", f"http://localhost:{port}"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        print("⏳ Tünel oluşturuluyor, lütfen bekleyin...")
        print("📱 URL'yi terminal çıktısında göreceksiniz")
        print("🔒 Bu tünel güvenli ve ücretsizdir")
        
        return process
        
    except Exception as e:
        print(f"❌ Tünel başlatma hatası: {e}")
        return None

def main():
    print("🌐 Cloudflare Tunnel Kurulumu")
    print("=" * 40)
    
    # Cloudflared kurulu mu kontrol et
    if not os.path.exists("cloudflared.exe"):
        print("📦 Cloudflared kurulu değil, kurulum başlatılıyor...")
        if not install_cloudflared():
            print("❌ Cloudflared kurulumu başarısız!")
            return
    
    # Tüneli başlat
    process = start_cloudflared_tunnel(5000)
    
    if process:
        print("\n📋 Kullanım Talimatları:")
        print("1. Terminal çıktısında URL'yi bekleyin")
        print("2. Mobil cihazınızda bu URL'yi açın")
        print("3. Uygulamayı kullanmaya başlayın!")
        print("\n⚠️ Not: Bu tünel ücretsiz ve güvenlidir")
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

