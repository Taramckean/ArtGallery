DROP TABLE artworks;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  birth_year INT2,
  art_movement VARCHAR(255)
);

CREATE TABLE artworks (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  materials VARCHAR(255),
  category VARCHAR(255),
  creation_year INT2,
  image VARCHAR(255),
  artist_id INT2 REFERENCES artists(id) ON DELETE CASCADE
);
