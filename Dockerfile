FROM python:3.9-slim

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
