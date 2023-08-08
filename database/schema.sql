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