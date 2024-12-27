-- Задание 2

-- 1.Название и продолжительность самого длительного трека
SELECT track_name, duration
  FROM tracks
 ORDER BY duration DESC
 LIMIT 1;

-- 2.Названия треков, продолжительность которых не менее 3,5 минут = 210 сек.
SELECT track_name, duration
  FROM tracks
 WHERE duration >= 210;

-- 3.Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name, release_year
  FROM collections
 WHERE release_year BETWEEN 2018 AND 2020;

-- 4.Исполнители, чьё имя состоит из одного слова
SELECT singer_name
  FROM singers
 WHERE singer_name NOT LIKE '% %';

-- 5.Название треков, которые содержат слово «мой» или «my»
SELECT track_name
  FROM tracks
 WHERE track_name ILIKE '%my%' OR track_name ILIKE '%мой%'; 

-- Задание 3

-- 1.Количество исполнителей в каждом жанре
SELECT g.genre_name, COUNT(sg.singer_id) AS count_singers
  FROM genres AS g 
       INNER JOIN singers_genres AS sg 
       ON g.genre_id = sg.genre_id
       GROUP BY g.genre_name;

-- 2.Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS count_tracks
  FROM tracks t
       INNER JOIN albums a
       ON t.album_id = a.album_id
       WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3.Средняя продолжительность треков по каждому альбому 
SELECT a.album_name, ROUND(AVG(t.duration), 1) AS average_track_duration
  FROM tracks t 
	   JOIN albums a
	   ON t.album_id = a.album_id
	   GROUP BY a.album_name 
	 
-- 4.Все исполнители, которые не выпустили альбомы в 2020 году
SELECT s.singer_name	   
  FROM singers s
 WHERE s.singer_id NOT IN (
       SELECT sa.singer_id
       FROM singers_albums sa 
       JOIN albums a ON  sa.album_id = a.album_id
       WHERE a.release_year = 2020
       );

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
-- Для примера, выбираем исполнителя с singer_id = 1 (Bruno Mars).

SELECT c.collection_name, t.track_name, s.singer_name 
  FROM collections c
       JOIN collection_tracks ct ON c.collection_id = ct.collection_id
       JOIN tracks t ON ct.track_id = t.track_id
       JOIN albums a ON t.album_id = a.album_id
       JOIN singers_albums sa ON a.album_id = sa.album_id
       JOIN singers s ON sa.singer_id = s.singer_id
       WHERE s.singer_id = 1;
