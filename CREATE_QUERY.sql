-- Создание базы данных
-- CREATE DATABASE music_db WITH OWNER postgres;

-- Создание таблицы Жанры
CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);
-- Создание таблицы исполнители
CREATE TABLE IF NOT EXISTS Singers (
    singer_id SERIAL PRIMARY KEY,
    singer_name VARCHAR(255) NOT NULL
);
-- Создание таблицы связей исполнителей с жанрами
CREATE TABLE IF NOT EXISTS Singers_Genres (
    singer_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (singer_id, genre_id),
    FOREIGN KEY (singer_id) REFERENCES Singers(singer_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
-- Создание таблицы Альбомы
CREATE TABLE IF NOT EXISTS Albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 1900) 
);
-- Создание таблицы связей исполнителей с альбомами
CREATE TABLE IF NOT EXISTS Singers_Albums (
    singer_id INTEGER,
    album_id INTEGER,
    PRIMARY KEY (singer_id, album_id),
    FOREIGN KEY (singer_id) REFERENCES Singers(singer_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);
-- Создание таблицы Треки
CREATE TABLE IF NOT EXISTS Tracks (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration > 0),
    album_id INTEGER,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);
-- Создание таблицы Сборники
CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 1900)
);
-- Создание таблицы связей Треков со Сборниками
CREATE TABLE IF NOT EXISTS Collection_Tracks (
    collection_id INTEGER,
    track_id INTEGER,
    PRIMARY KEY (collection_id, track_id),
    FOREIGN KEY (collection_id) REFERENCES Collections(collection_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id)
);