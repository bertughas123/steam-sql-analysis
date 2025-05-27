# 🎮 Steam SQL Game Analysis Project

This project is a SQL-based analysis and reporting system built on top of a custom dataset of 32 real-world Steam games. The goal is to create a normalized database schema, perform analytical queries, and clean data using SQL.

## 🎯 Proje Amacı
Steam platformundaki oyunlara ait veriler kullanılarak anlamlı bir veritabanı yapısı oluşturmak, bu yapıyı SQL sorgularıyla analiz etmek ve özelleştirilmiş veriler üzerinden anlamlı bilgiler çıkarmaktır. Gerçek dünya veri setlerinden faydalanılmakla birlikte, analizlerde yalnızca projede yer alan 30 oyunla ilişkili bilgiler filtrelenmiştir.

## 🔍 İhtiyaç Analizi
- Oyunların temel bilgilerini saklama (fiyat, çıkış tarihi, kopya, takipçi vb.)
- Geliştirici sınıfı ve etiketleriyle oyunları ilişkilendirme
- Geliştirici türlerine göre oyun sayısı, ortalama fiyat, toplam gelir gibi metrikleri analiz etme
- Etiket–oyun ilişkilerinin sorgulanabilir hale getirilmesi

## 🧱 Veritabanı Tasarımı

### 🗃️ Tablolar
- `games`: Her oyun için temel bilgiler
- `tags`: Etiketler (örn. Action, Co-op)
- `game_tags`: Oyun–etiket ilişkisi (many-to-many)
- `game_classes`: Geliştirici sınıflarına ait özet bilgiler (örn. Indie, AAA)

### 🔄 İlişkiler (E-R Model)
- `games` ↔ `game_tags` ↔ `tags` → Many-to-many
- `games.class` ↔ `game_classes.class_name` → One-to-one

## 📥 Kullanılan Veri Dosyaları
- `odev.sqlite`: Tüm verileri içeren SQLite dosyası
- `scripts/` klasörü:
  - `create_tables.sql`: Tabloların oluşturulması
  - `insert_data.sql`: Veri ekleme
  - `update_delete.sql`: Veri temizleme, hata düzeltme ve silme
  - `analysis_queries.sql`: 20+ SQL sorgusu ile analizler

## 🧹 Veri Temizleme İşlemleri
```sql
UPDATE games SET price = 29.99 WHERE price = 0;
UPDATE games SET release_date = '2024-01-01' WHERE release_date = '3024-01-01';
DELETE FROM games WHERE name = 'Fake Game Extra';
