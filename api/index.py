from flask import Flask, render_template, request, jsonify
import pandas as pd
import pyarrow.parquet as pq
import os

app = Flask(__name__)

# Veri dosyasını yükle
def load_data():
    try:
        # Vercel'de dosya yolu
        data_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'yatirim_tesvik_belgeleri.parquet')
        if not os.path.exists(data_path):
            # Alternatif yol
            data_path = 'yatirim_tesvik_belgeleri.parquet'
        
        df = pq.read_table(data_path).to_pandas()
        return df
    except Exception as e:
        print(f"Veri yükleme hatası: {e}")
        return pd.DataFrame()

# Ana sayfa
@app.route('/')
def index():
    return render_template('index.html')

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
        df['firma_adi'].str.contains(query, case=False, na=False) |
        df['il'].str.contains(query, case=False, na=False) |
        df['ilce'].str.contains(query, case=False, na=False) |
        df['sektor'].str.contains(query, case=False, na=False)
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
        'total_companies': df['firma_adi'].nunique(),
        'total_cities': df['il'].nunique(),
        'total_sectors': df['sektor'].nunique(),
        'year_range': f"{df['yil'].min()} - {df['yil'].max()}"
    }
    return jsonify(stats)

# Vercel için
if __name__ == '__main__':
    app.run(debug=True)
