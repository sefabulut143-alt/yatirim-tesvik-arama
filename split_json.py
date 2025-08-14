import json
import os

def split_json_file():
    try:
        print("JSON dosyası okunuyor...")
        with open('all_companies.json', 'r', encoding='utf-8') as f:
            all_data = json.load(f)
        
        print(f"Toplam {len(all_data)} kayıt bulundu")
        
        # İlk 1000 kaydı al (hızlı yükleme için)
        first_1000 = all_data[:1000]
        
        # İlk 1000 kaydı ayrı dosyaya kaydet
        with open('companies_1000.json', 'w', encoding='utf-8') as f:
            json.dump(first_1000, f, ensure_ascii=False, indent=2)
        
        print(f"✅ İlk 1000 firma companies_1000.json dosyasına kaydedildi")
        
        # Tüm verileri de ayrı dosyaya kaydet (daha küçük format)
        with open('all_companies_mini.json', 'w', encoding='utf-8') as f:
            json.dump(all_data, f, ensure_ascii=False, separators=(',', ':'))
        
        print(f"✅ Tüm {len(all_data)} firma all_companies_mini.json dosyasına kaydedildi")
        
        # Dosya boyutlarını kontrol et
        size_1000 = os.path.getsize('companies_1000.json') / 1024 / 1024
        size_all = os.path.getsize('all_companies_mini.json') / 1024 / 1024
        
        print(f"📊 Dosya boyutları:")
        print(f"   - companies_1000.json: {size_1000:.1f} MB")
        print(f"   - all_companies_mini.json: {size_all:.1f} MB")
        
    except Exception as e:
        print(f"❌ Hata: {e}")

if __name__ == "__main__":
    split_json_file()

