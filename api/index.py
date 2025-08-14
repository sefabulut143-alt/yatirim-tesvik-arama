from flask import Flask, render_template, request, jsonify
import pandas as pd
import pyarrow.parquet as pq
import os
import json

app = Flask(__name__)

# Veri dosyasını yükle
def load_data():
    try:
        # Parquet dosyasının yolu
        data_path = os.path.join(os.path.dirname(__file__), '..', '2009-2023_aralık_ytb_listeleri.parquet')
        if not os.path.exists(data_path):
            # Alternatif yol
            data_path = '2009-2023_aralık_ytb_listeleri.parquet'
        
        df = pq.read_table(data_path).to_pandas()
        return df
    except Exception as e:
        print(f"Veri yükleme hatası: {e}")
        return pd.DataFrame()

# Ana sayfa
@app.route('/')
def index():
    return render_template('index.html')

# Tüm verileri döndüren API
@app.route('/api/data')
def get_data():
    df = load_data()
    if df.empty:
        return jsonify([])
    
    # Verileri JSON formatına çevir
    data = []
    for _, row in df.iterrows():
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
            sabit_yatirim_str = f"{sabit_yatirim:,.0f} TL"
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
    
    return jsonify(data)

# Arama API'si
@app.route('/api/search')
def search():
    query = request.args.get('q', '').strip()
    if not query:
        return jsonify({'results': [], 'total': 0})
    
    df = load_data()
    if df.empty:
        return jsonify({'results': [], 'total': 0, 'error': 'Veri yüklenemedi'})
    
    # Arama
    mask = (
        df['FİRMANIN ADI'].str.contains(query, case=False, na=False) |
        df['YATIRIM YERİ İLİ'].str.contains(query, case=False, na=False) |
        df['YATIRIM YERİ İLÇESİ'].str.contains(query, case=False, na=False) |
        df['YATIRIMIN SEKTÖRÜ'].str.contains(query, case=False, na=False)
    )
    
    results = df[mask].head(100).to_dict('records')
    return jsonify({'results': results, 'total': len(results)})

# İstatistikler API'si
@app.route('/api/stats')
def stats():
    df = load_data()
    if df.empty:
        return jsonify({'error': 'Veri yüklenemedi'})
    
    stats = {
        'total_records': len(df),
        'total_companies': df['FİRMANIN ADI'].nunique(),
        'total_cities': df['YATIRIM YERİ İLİ'].nunique(),
        'total_sectors': df['YATIRIMIN SEKTÖRÜ'].nunique(),
        'year_range': f"{df['BELGE TARİHİ'].dt.year.min()} - {df['BELGE TARİHİ'].dt.year.max()}"
    }
    return jsonify(stats)

# Vercel için
if __name__ == '__main__':
    app.run(debug=True)
