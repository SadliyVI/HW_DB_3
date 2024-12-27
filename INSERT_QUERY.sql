-- HomeWork по теме «Продвинутая выборка данных»
-- Задание 1

-- Добавление жанров
INSERT INTO genres (genre_id, genre_name)
VALUES
(1, 'Pop'),
(2, 'R&B'),
(3, 'Rock'),
(4, 'Hip-Hop'),
(5, 'Electronic');

-- Добавление исполнителей
INSERT INTO singers (singer_id, singer_name)
VALUES
(1, 'Bruno Mars'),
(2, 'Justin Bieber'),
(3, 'Rihanna'),
(4, 'Lady Gaga'),
(5, 'Katy Perry');

-- Установление связей между жанрами и исполнителями
INSERT INTO singers_genres (singer_id, genre_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(4, 3),
(5, 1),
(5, 4);

-- Добавление альбомов
INSERT INTO albums (album_id, album_name, release_year)
VALUES
(1, 'Unorthodox Jukebox', 2012),
(2, 'Purpose', 2015),
(3, 'Anti', 2016),
(4, 'Chromatica', 2020),
(5, 'Teenage Dream', 2010),
(6, '21', 2011),
(7, '1989', 2014);

-- Установление связей между исполнителями и альбомами
INSERT INTO singers_albums (singer_id, album_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6), 
(2, 7), 
(3, 5), 
(4, 7), 
(5, 1); 

-- Добавление треков
INSERT INTO tracks (track_id, track_name, duration, album_id)
VALUES
(1, 'Locked Out of Heaven', 233, 1),
(2, 'Sorry', 200, 2),
(3, 'My Work', 219, 3),
(4, 'Rain On Me', 182, 4),
(5, 'Uptown Funk', 278, 1),
(6, 'Love Yourself', 213, 2),
(7, 'Firework', 222, 5),
(8, 'Someone Like You', 210, 6),
(9, 'Shake It Off', 201, 7),
(10, 'California Gurls', 226, 5),
(11, 'Just the Way You Are', 217, 1),
(12, 'As Long as You Love Me', 208, 2),
(13, 'We Found Love', 214, 3),
(14, 'My Bad Romance', 229, 4),
(15, 'Dark Horse', 215, 5);

-- Добавление сборников
INSERT INTO collections (collection_id, collection_name, release_year)
VALUES
(1, 'Best of 2010s', 2020),
(2, 'Summer Hits', 2022),
(3, 'Pop Anthems', 2021),
(4, 'Dance Party', 2023),
(5, 'Top 40 Hits', 2022);

-- Установление связей между треками и сборниками
INSERT INTO collection_tracks (collection_id, track_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 10),
(5, 11),
(5, 12),
(1, 13),
(2, 14);


