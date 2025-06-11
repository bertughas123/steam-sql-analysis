--HATA DUZELTME GAMES TABLOSU İÇİN
--1. Fiyat 0 olan oyunların fiyatını düzelt (örnek fiyat ataması):
--1.Sorgu Sınıf başına oyun sayısı
SELECT class, COUNT(*) AS game_count
FROM games
GROUP BY class

-- 2.Sorgu Her bir sınıftaki oyunun ortalama kopya satışı
SELECT class, ROUND(AVG(copies_sold), 0) AS avg_copies
FROM games
GROUP BY class;

-- 3.Sorgu 1 milyondan fazla satmış oyunlar
SELECT name, copies_sold
FROM games
WHERE copies_sold > 1000000;

--4.Sorgu En fazla steam takipçisi olan 5 oyun
SELECT name, steam_followers, class
FROM games
ORDER BY steam_followers DESC
LIMIT 5;
-- 5.Sorgu Indie sınıfındaki en çok takipçili 5 oyun
SELECT name, steam_followers
FROM games
WHERE class = 'Indie'
ORDER BY steam_followers DESC
LIMIT 5;

-- 6.Sorgu Erken erişimde olan oyunların ortalama fiyatları
SELECT ROUND(AVG(price), 2) AS avg_price_early_access
FROM games
WHERE early_access = 1;

-- 7.Sorgu 2024'te çıkıp fiyatı 30 Dolarin altında olan oyunlar
SELECT name, release_date, price
FROM games
WHERE release_date LIKE '2024%' AND price < 30;


-- 8.Sorgu Yayıncı ve geliştiricisi aynı olan oyunlar
SELECT name
FROM games
WHERE publisher = developer;

-- 9.Sorgu Fiyatı 50 $ üzerindeki oyunlar
SELECT name, price
FROM games
WHERE price > 50;

-- 10.Sorgu En çok kazanan 5 oyun ve gelirleri
SELECT name, revenue
FROM games
ORDER BY revenue DESC
LIMIT 5;

-- 11.Sorgu En yüksek fiyatlı 5 oyun ve ortalama satışları
WITH top5_pricey_games AS (
    SELECT name, price, copies_sold
    FROM games
    ORDER BY price DESC
    LIMIT 5
)
SELECT
    name,
    price,
    copies_sold,
    (SELECT ROUND(AVG(copies_sold), 0) FROM top5_pricey_games) AS avg_copies_in_top5
FROM top5_pricey_games;


-- 12.Sorgu Tag’lere göre 32 oyunun toplam sayısı (sadece kullanılanlar)
SELECT t.tag_name, COUNT(gt.game_id) AS game_count
FROM tags t
JOIN game_tags gt ON t.tag_id = gt.tag_id
GROUP BY t.tag_name
ORDER BY game_count DESC
LIMIT 10;

--– 13.Sorgu Her sınıfta toplam gelir ve ortalama gelir (oyun başına)
SELECT class,
       SUM(revenue) AS total_revenue,
       ROUND(AVG(revenue), 0) AS avg_revenue
FROM games
GROUP BY class
ORDER BY total_revenue DESC;

--  14.Sorgu Oyunların fiyatına göre gelir verimliliği (revenue/price)
SELECT name, revenue, price,
       ROUND(revenue / price, 2) AS revenue_per_price
FROM games
WHERE price > 0
ORDER BY revenue_per_price DESC
LIMIT 5;
-- 15.Sorgu 2024 yılında çıkmış oyunların toplam satış hacmi
SELECT SUM(copies_sold) AS total_sales_2024
FROM games
WHERE release_date LIKE '2024%';


-- 16.Sorgu Tag’lerin toplam kullanıldığı sınıf çeşitliliği (sadece 30 oyun içinde)
SELECT t.tag_name, COUNT(DISTINCT g.class) AS class_diversity
FROM tags t
JOIN game_tags gt ON t.tag_id = gt.tag_id
JOIN games g ON g.game_id = gt.game_id
GROUP BY t.tag_name
ORDER BY class_diversity DESC;

--17.Sorgu Tag’lerin ortalama oyun başına sağladığı gelir (sadece bu 30 oyun için)
SELECT
    t.tag_name,
    ROUND(AVG(g.revenue), 0) AS avg_revenue_per_game_with_tag
FROM tags t
JOIN game_tags gt ON t.tag_id = gt.tag_id
JOIN games g ON g.game_id = gt.game_id
GROUP BY t.tag_name
ORDER BY avg_revenue_per_game_with_tag DESC
LIMIT 10;

-- 18.Sorgu Oyun başına ortalama tag sayısı
SELECT ROUND(AVG(tag_count), 2) AS avg_tags_per_game
FROM (
  SELECT game_id, COUNT(tag_id) AS tag_count
  FROM game_tags
  GROUP BY game_id
);

-- 19.Sorgu Her sınıftaki oyunların ortalama takipçi sayısı
SELECT class, ROUND(AVG(steam_followers), 0) AS avg_followers
FROM games
GROUP BY class;


-- 20.Sorgu Fiyatı 0 olan oyunlar (ve düzeltilmiş mi kontrol)
SELECT name, price
FROM games
WHERE price = 0.0;
