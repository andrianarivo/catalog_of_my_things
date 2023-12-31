CREATE DATABASE catalog_of_my_things;

CREATE TABLE item(
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INT,
    source_id INT,
    author_id INT,
    label_id INT,
    CONSTRAINT genre_id
     FOREIGN KEY(genre_id)
         REFERENCES genre(id)
         ON DELETE CASCADE,
    CONSTRAINT source_id
     FOREIGN KEY(source_id)
         REFERENCES source(id)
         ON DELETE CASCADE,
    CONSTRAINT author_id
     FOREIGN KEY(author_id)
         REFERENCES author(id)
         ON DELETE CASCADE,
    CONSTRAINT label_id
     FOREIGN KEY(label_id)
         REFERENCES label(id)
         ON DELETE CASCADE
);

CREATE TABLE book(
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    genre_id INT,
    source_id INT,
    author_id INT,
    label_id INT,
    CONSTRAINT genre_id
     FOREIGN KEY(genre_id)
         REFERENCES genre(id)
         ON DELETE CASCADE,
    CONSTRAINT source_id
     FOREIGN KEY(source_id)
         REFERENCES source(id)
         ON DELETE CASCADE,
    CONSTRAINT author_id
     FOREIGN KEY(author_id)
         REFERENCES author(id)
         ON DELETE CASCADE,
    CONSTRAINT label_id
     FOREIGN KEY(label_id)
         REFERENCES label(id)
         ON DELETE CASCADE
);

CREATE TABLE label(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
);

CREATE TABLE music_album(
  id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE genre(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
  PRIMARY KEY(id)
);

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE INDEX on music_album(last_id)
CREATE INDEX on music_album(genre_id)
CREATE INDEX on music_album(author_id)
CREATE INDEX on book(label_id)
CREATE INDEX on book(genre_id)
CREATE INDEX on book(author_id)
CREATE INDEX on games(label_id)
CREATE INDEX on games(genre_id)
CREATE INDEX on games(author_id)
