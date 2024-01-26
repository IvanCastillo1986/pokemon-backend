DROP TABLE IF EXISTS users, decks, dvs, pokemon, items, bags;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    uuid TEXT,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0
);

CREATE TABLE decks (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR,
    pokemon_id INT,
    exp INT DEFAULT 0,
    lvl INT DEFAULT 1
);

CREATE TABLE dvs (
    id SERIAL PRIMARY KEY,
    deck_id INT,
    hp_dv INT,
    atk_dv INT,
    def_dv INT,
    special_atk_dv INT,
    special_def_dv INT,
    speed_dv INT
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
