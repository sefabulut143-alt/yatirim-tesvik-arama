import pandas as pd
import pyarrow.parquet as pq
import json
import os

def convert_parquet_to_json():
    try:
        # Parquet dosyasını oku
        print("Parquet dosyası okunuyor...")
        df = pq.read_table('2009-2023_aralık_ytb_listeleri.parquet').to_pandas()
        
        print(f"Toplam {len(df)} kayıt bulundu")
        
        # Verileri JSON formatına çevir
        data = []
        for index, row in df.iterrows():
            if index % 1000 == 0:
                print(f"İşleniyor: {index}/{len(df)}")
            
            # Belge no ve türünü ayır
            belge_info = str(row['BELGE NO / SERMAYE TÜRÜ']).split(' / ')
            belge_no = belge_info[0] if len(belge_info) > 0 else ''
            belge_turu = belge_info[1] if len(belge_info) > 1 else ''
            
            # Tarihleri formatla
            belge_tarihi = str(row['BELGE TARİHİ']).split(' ')[0] if pd.notna(row['BELGE TARİHİ']) else ''
            belge_bitis_tarihi = str(row['YATIRIMIN BİTİŞ TARİHİ']).split(' ')[0] if pd.notna(row['YATIRIMIN BİTİŞ TARİHİ']) else ''
            
            # Sabit yatırım tutarını formatla
            sabit_yatirim = row['SABİT YATIRIM (TL)']
            if pd.notna(sabit_yatirim):
                try:
                    sabit_yatirim_str = f"{float(sabit_yatirim):,.0f} TL"
                except:
                    sabit_yatirim_str = str(sabit_yatirim) + " TL"
            else:
                sabit_yatirim_str = ''
            
            item = {
                'belge_no': belge_no,
                'belge_turu': belge_turu,
                'belge_tarihi': belge_tarihi,
                'belge_bitis_tarihi': belge_bitis_tarihi,
                'yatirim_yeri': str(row['YATIRIM YERİ İLİ']) if pd.notna(row['YATIRIM YERİ İLİ']) else '',
                'yatirim_ilce': str(row['YATIRIM YERİ İLÇESİ']) if pd.notna(row['YATIRIM YERİ İLÇESİ']) else '',
                'firma_adi': str(row['FİRMANIN ADI']) if pd.notna(row['FİRMANIN ADI']) else '',
                'yatirim_sektoru': str(row['YATIRIMIN SEKTÖRÜ']) if pd.notna(row['YATIRIMIN SEKTÖRÜ']) else '',
                'yatirim_cinsi': str(row['YATIRIMIN CİNSİ']) if pd.notna(row['YATIRIMIN CİNSİ']) else '',
                'kdv_istisnasi': str(row['KDV İSTİSNASI']) if pd.notna(row['KDV İSTİSNASI']) else '',
                'gumruk_vergisi_muafiyeti': str(row['GÜMRÜK VERGİSİ MUAFİYETİ']) if pd.notna(row['GÜMRÜK VERGİSİ MUAFİYETİ']) else '',
                'vergi_indirimi': str(row['VERGİ İNDİRİMİ']) if pd.notna(row['VERGİ İNDİRİMİ']) else '',
                'sabit_yatirim_tutari': sabit_yatirim_str,
                'belge_durumu': str(row['BELGE DURUMU']) if pd.notna(row['BELGE DURUMU']) else ''
            }
            data.append(item)
        
        # JSON dosyasına kaydet
        print("JSON dosyası oluşturuluyor...")
        with open('all_companies.json', 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        
        print(f"✅ Başarılı! {len(data)} firma JSON dosyasına kaydedildi")
        print("📁 Dosya: all_companies.json")
        
        # İstatistikler
        unique_cities = len(set([item['yatirim_yeri'] for item in data if item['yatirim_yeri']]))
        unique_sectors = len(set([item['yatirim_sektoru'] for item in data if item['yatirim_sektoru']]))
        
        print(f"📊 İstatistikler:")
        print(f"   - Toplam Firma: {len(data):,}")
        print(f"   - Toplam İl: {unique_cities}")
        print(f"   - Toplam Sektör: {unique_sectors}")
        
    except Exception as e:
        print(f"❌ Hata: {e}")

if __name__ == "__main__":
    convert_parquet_to_json()
