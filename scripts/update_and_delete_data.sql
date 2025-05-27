UPDATE games
SET price = 29.99
WHERE price = 0.0
AND name IN (
  'The First Descendant',
  'Supermarket Simulator',
  'Lust Goddess',
  'Dark and Darker',
  'SMITE 2',
  'Palia',
  'Once Human'
);
--2. Eksik developer bilgisini güncelle:
UPDATE games
SET developer = 'GSC Game World'
WHERE name = 'S.T.A.L.K.E.R. 2: Heart of Chornobyl'
AND developer IS NULL;
--3. Eksik publisher bilgisini güncelle:
UPDATE games
SET publisher = 'Keen Games GmbH'
WHERE name = 'Enshrouded'
AND publisher IS NULL;
--4. Yanlış veya boş tarihleri düzelt (örnek tarih):
UPDATE games
SET release_date = '2024-07-09'
WHERE name = 'Once Human'
AND release_date = '3024-07-09';

UPDATE games
SET release_date = '2024-01-24'
WHERE name = 'Enshrouded'
AND release_date IS NULL;
--5. Erken erişim bilgisini düzelt (örnek):
UPDATE games
SET early_access = 1
WHERE name = 'Once Human'
AND early_access = 0;
--6. Fazladan gereksiz kayıtları sil:
