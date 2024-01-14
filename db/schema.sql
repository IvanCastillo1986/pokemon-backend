DROP DATABASE IF EXISTS pokemon_dev;
CREATE DATABASE pokemon_dev;

\c pokemon_dev;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    uuid TEXT,
    has_chosen_starter BOOLEAN DEFAULT false,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0
);


CREATE TABLE decks (
    id SERIAL PRIMARY KEY, -- this forms the bridge between individual_pokemon_stats.deck_id and decks table
    user_id VARCHAR,
    pokemon_id INT, -- this forms the bridge between the base_stat and individual_pokemon_stats
    exp INT DEFAULT 0, -- new properties, will be added to pokemon objects in front-end
    lvl INT DEFAULT 1 -- new properties, will be added back to decks row in back-end
);

CREATE TABLE dvs (
    id SERIAL PRIMARY KEY,
    deck_id INT,
    hp INT,
    atk INT,
    def INT,
    special_atk INT,
    special_def INT,
    speed INT
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
    front_img TEXT,
    rear_img TEXT
);


CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR,  -- potion, ether, etc.
    effect VARCHAR, -- for status ailments, i.e. antidote, burn heal, etc.
    hp_restored INT, -- for potion, lemonade, etc.
    pp_restored INT, -- for recovering move points, i.e. ether
    item_desc VARCHAR -- i.e. Potion: restore 20 hp
);

CREATE TABLE bags (
    id SERIAL PRIMARY KEY,
    user_id TEXT,
    item_id INT
);


