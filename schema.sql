-- Database schema to keep the structure of the entire database
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  publis_date DATE,
  multi_player TEXT,
  last_player_at DATE,
  author_id INT,
  label_id INT,
  genre_id INT,
  archived BOOLEAN,
  CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES authors(id) ON DELETE CASCADE,
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id) ON DELETE CASCADE,
  CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id) ON DELETE CASCADE
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

-- Creation of the music table
CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  PRIMARY KEY (id)
);

-- Creation of the genres table
CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(30),
  PRIMARY KEY (id)
);

-- Creation of the labels table
CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(50),
  color VARCHAR(30)
);

-- Creation of the Authors table
CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  PRIMARY KEY (id)
);

/* Creation of the 1:M associations between music_albums, genres,
labels, and authors tables */

-- genre 1:M music_albums
ALTER TABLE music_albums
ADD genre_id INT,
ADD CONSTRAINT fk_genres
FOREIGN KEY (genre_id)
REFERENCES genres(id);

-- label 1:M music_albums
ALTER TABLE music_albums
ADD label_id INT,
ADD CONSTRAINT fk_labels
FOREIGN KEY (label_id)
REFERENCES labels(id);

-- author 1:M music_albums
ALTER TABLE music_albums
ADD author_id INT,
ADD CONSTRAINT fk_authors
FOREIGN KEY (author_id)
REFERENCES authors(id);

-- creation of the books table
CREATE TABLE Book (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  archived BOOLEAN,
  label_id INT,
  genre_id INT,
  author_id INT,
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id)
);
