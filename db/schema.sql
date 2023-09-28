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

CREATE TABLE pokemon (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    hp INT,
    atk INT,
    def INT,
    special_atk INT,
    special_def INT,
    speed INT,
    type1 VARCHAR,
    type2 VARCHAR,
    move1 VARCHAR,
    move2 VARCHAR,
    exp INT,
    lvl INT,
    front_img TEXT,
    rear_img TEXT
);
