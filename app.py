from flask import Flask, render_template, request, jsonify
import pandas as pd
import os
from datetime import datetime

app = Flask(__name__)

# Veri dosyasını yükle
def load_data():
    try:
        df = pd.read_parquet('2009-2023_aralık_ytb_listeleri.parquet')
        return df
    except Exception as e:
        print(f"Veri yükleme hatası: {e}")
        return pd.DataFrame()

# Global veri değişkeni
data_df = load_data()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/search')
def search():
    query = request.args.get('q', '').strip().upper()
    
    if not query or len(query) < 2:
        return jsonify({'results': [], 'count': 0})
    
    try:
        # Firma adına göre arama
        if 'firma_adi' in data_df.columns:
            results = data_df[data_df['firma_adi'].str.contains(query, case=False, na=False)]
        else:
            # Sütun adı farklı olabilir, tüm string sütunlarda ara
            string_columns = data_df.select_dtypes(include=['object']).columns
            mask = pd.Series([False] * len(data_df))
            for col in string_columns:
                mask |= data_df[col].str.contains(query, case=False, na=False)
            results = data_df[mask]
        
        # Sonuçları formatla
        formatted_results = []
        for _, row in results.head(50).iterrows():  # İlk 50 sonuç
            result_dict = {}
            for col in row.index:
                if pd.notna(row[col]):
                    if isinstance(row[col], datetime):
                        result_dict[col] = row[col].strftime('%d.%m.%Y')
                    else:
                        result_dict[col] = str(row[col])
                else:
                    result_dict[col] = ''
            formatted_results.append(result_dict)
        
        return jsonify({
            'results': formatted_results,
            'count': len(results)
        })
    
    except Exception as e:
        return jsonify({'error': str(e), 'results': [], 'count': 0})

@app.route('/api/stats')
def stats():
    try:
        total_records = len(data_df)
        return jsonify({
            'total_records': total_records,
            'last_updated': '2023 Aralık'
        })
    except:
        return jsonify({'total_records': 0, 'last_updated': 'Bilinmiyor'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
