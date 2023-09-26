DROP DATABASE IF EXISTS pokemon_dev;
CREATE DATABASE pokemon_dev;

\c pokemon_dev;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    uuid TEXT
);

CREATE TABLE decks (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR,
    pokemon_id INT
);

