DROP DATABASE IF EXISTS pokemon_dev;
CREATE DATABASE pokemon_dev;

\c pokemon_dev;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    uuid TEXT,
    has_chosen_starter BOOLEAN DEFAULT false
);

CREATE TABLE decks (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR,
    pokemon_id INT,
    exp INT DEFAULT 0, -- new properties, will be added to pokemon objects in front-end
    lvl INT DEFAULT 1 -- new properties, will be added back to decks row in back-end
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
    -- exp INT, -- will soon be disregarded
    -- lvl INT, -- will soon be disregarded
    front_img TEXT,
    rear_img TEXT
);
