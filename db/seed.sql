\c pokemon_dev;

INSERT INTO users (
    email, uuid, has_chosen_starter, wins, losses
) VALUES 
('icastillo@live.com', '7XzFvOUVS4eQHGI8ClxNbN7qY7b2', false, 0, 0) 
;

INSERT INTO decks (
    user_id, pokemon_id, exp, lvl
) VALUES 
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 35, 0, 1),
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 46, 0, 1),
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 100, 0, 1),
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 111, 0, 1),
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 21, 0, 1)
;

INSERT INTO dv (
    deck_id, hp, atk, def, special_atk, special_def, speed
) VALUES 
(1, 9, 2, 3, 1, 3, 4),
(2, 7, 3, 1, 2, 2, 5),
(3, 11, 2, 4, 2, 2, 3),
(4, 12, 4, 1, 3, 1, 5),
(5, 10, 1, 5, 2, 3, 2)
;


INSERT INTO items (
    item_name, effect, hp_restored, pp_restored, item_desc
) VALUES 
('potion', 'heal', 20, null, 'Restores 20 hp'),
('super potion', 'heal', 50, null, 'Restores 50 hp'),
('lemonade', 'heal', 80, null, 'Restores 80 hp'),
('ether', 'restore', null, 10, 'Restores 10 pp')
;

INSERT INTO bags (
    user_id, item_id
) VALUES 
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 1),
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 1),
('7XzFvOUVS4eQHGI8ClxNbN7qY7b2', 4)
;

INSERT INTO pokemon (
    name, hp, atk, def, special_atk, special_def, speed, type1, type2, move1, move2, front_img, rear_img
) VALUES 
(
    'Bulbasaur', 45, 49, 49, 65, 65, 45, 'grass', 'poison', 'Tackle', 'Vine Whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/1.png'
),
(
    'Ivysaur', 60, 62, 63, 80, 80, 60, 'grass', 'poison', 'Tackle', 'Vine Whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/2.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/2.png'
),
(
    'Venusaur', 80, 82, 83, 100, 100, 80, 'grass', 'poison', 'Tackle', 'Vine Whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/3.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/3.png'
),
(
    'Charmander', 39, 52, 43, 60, 50, 65, 'fire', null, 'Scratch', 'Ember',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/4.png'
),
(
    'Charmeleon', 58, 64, 58, 80, 65, 80, 'fire', null, 'Scratch', 'Ember',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/5.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/5.png'
),
(
    'Charizard', 78, 84, 78, 109, 85, 100, 'fire', 'flying', 'Scratch', 'Ember',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/6.png'
),
(
    'Squirtle', 44, 48, 65, 50, 64, 43, 'water', null, 'bite', 'water-gun',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/7.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/6.png'
),
(
    'Wartortle', 59, 63, 80, 65, 80, 58, 'water', null, 'bite', 'water-gun',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/8.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/8.png'
),
(
    'Blastoise', 79, 83, 100, 85, 105, 78, 'water', null, 'bite', 'hydro-pump',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/9.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/9.png'
),
(
    'Caterpie', 45, 30, 35, 20, 20, 45, 'bug', null, 'bug-bite', 'tackle',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/10.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/10.png'
),
(
    'Metapod', 50, 20, 55, 25, 25, 30, 'bug', null, 'harden', 'string-shot',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/11.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/11.png'
),
(
    'Butterfree', 60, 45, 50, 90, 80, 70, 'bug', null, 'gust', 'whirlwind',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/12.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/12.png'
),
(
    'Weedle', 40, 35, 30, 20, 20, 50, 'bug', null, 'bug-bite', 'poison-sting',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/13.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/13.png'
),
(
    'Kakuna', 45, 25, 50, 25, 25, 35, 'bug', null, 'harden', 'string-shot',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/14.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/14.png'
),
(
    'Beedrill', 65, 90, 40, 45, 80, 75, 'bug', null, 'twineedle', 'pin-missile',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/15.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/15.png'
),
(
    'Pidgey', 40, 45, 40, 35, 35, 56, 'normal', null, 'wing-attack', 'whirlwind',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/16.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/16.png'
),
(
    'Pidgeotto', 63, 60, 55, 50, 50, 71, 'normal', null, 'wing-attack', 'whirlwind',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/17.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/17.png'
),
(
    'Pidgeot', 83, 80, 75, 70, 70, 101, 'normal', null, 'wing-attack', 'whirlwind',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/18.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/18.png'
),
(
    'Rattata', 30, 56, 35, 25, 35, 72, 'normal', null, 'quick-attack', 'focus-energy',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/19.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/19.png'
),
(
    'Raticate', 55, 81, 60, 50, 70, 97, 'normal', null, 'bite', 'focus-energy',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/20.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/20.png'
),
(
    'Spearow', 40, 60, 30, 31, 31, 70, 'normal', null, 'wing-attack', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/21.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/21.png'
),
(
    'Fearow', 65, 90, 65, 61, 61, 100, 'normal', null, 'wing-attack', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/22.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/22.png'
),
(
    'Ekans', 35, 60, 44, 40, 54, 55, 'poison', null, 'poison-sting', 'bite',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/23.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/23.png'
),
(
    'Arbok', 60, 95, 69, 65, 79, 80, 'poison', null, 'slam', 'bite',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/24.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/24.png'
),
(
    'Pikachu', 35, 55, 40, 50, 50, 90, 'electric', null, 'slam', 'double-kick',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/25.png'
),
(
    'Raichu', 60, 90, 55, 90, 80, 110, 'electric', null, 'slam', 'tail-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/26.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/26.png'
),
(
    'Sandshrew', 50, 75, 85, 20, 30, 40, 'ground', null, 'sand-attack', 'poison-sting',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/27.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/27.png'
),
(
    'Sandslash', 75, 110, 110, 45, 55, 65, 'ground', null, 'poison-sting', 'swift',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/28.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/28.png'
),
(
    'Nidoran F', 55, 47, 52, 40, 40, 41, 'poison', null, 'scratch', 'double-kick',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/29.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/29.png'
),
(
    'Nidorina', 70, 62, 67, 55, 55, 56, 'poison', null, 'double-kick', 'tail-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/30.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/30.png'
),
(
    'Nidoqueen', 90, 92, 87, 75, 85, 76, 'poison', null, 'double-kick', 'poison-sting',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/31.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/31.png'
),
(
    'Nidoran M', 46, 57, 40, 40, 40, 50, 'poison', null, 'double-kick', 'horn-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/32.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/32.png'
),
(
    'Nidorino', 61, 72, 57, 55, 55, 65, 'poison', null, 'double-kick', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/33.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/33.png'
),
(
    'Nidoking', 81, 112, 77, 85, 75, 85, 'poison', null, 'double-kick', 'megahorn',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/34.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/34.png'
),
(
    'Clefairy', 70, 45, 48, 60, 65, 35, 'fairy', null, 'double-slap', 'sing',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/35.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/35.png'
),
(
    'Clefable', 95, 70, 73, 95, 90, 60, 'fairy', null, 'pound', 'double-slap',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/36.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/36.png'
),
(
    'Vulpix', 38, 41, 40, 50, 65, 65, 'fire', null, 'roar', 'flamethrower',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/37.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/37.png'
),
(
    'Ninetales', 73, 76, 75, 81, 110, 110, 'fire', null, 'fire-spin', 'tackle',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/38.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/38.png'
),
(
    'Jigglypuff', 115, 45, 20, 45, 25, 20, 'normal', null, 'pound', 'double-slap',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/39.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/39.png'
),
(
    'Wigglytuff', 140, 70, 45, 85, 50, 45, 'normal', null, 'pound', 'double-slap',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/40.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/40.png'
),
(
    'Zubat', 40, 45, 35, 30, 40, 55, 'poison', null, 'wing-attack', 'bite',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/41.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/41.png'
),
(
    'Golbat', 75, 80, 70, 65, 75, 90, 'poison', null, 'wing-attack', 'supersonic',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/42.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/42.png'
),
(
    'Oddish', 45, 50, 55, 75, 65, 30, 'grass', null, 'acid', 'solar-beam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/43.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/43.png'
),
(
    'Gloom', 60, 65, 70, 85, 75, 40, 'grass', null, 'acid', 'razor-leaf',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/44.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/44.png'
),
(
    'Vileplume', 75, 80, 85, 110, 90, 50, 'grass', null, 'poison-powder', 'petal-blizzard',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/45.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/45.png'
),
(
    'Paras', 35, 70, 55, 45, 55, 25, 'bug', null, 'absorb', 'growth',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/46.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/46.png'
),
(
    'Parasect', 60, 95, 80, 60, 80, 30, 'bug', null, 'growth', 'spore',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/47.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/47.png'
),
(
    'Venonat', 60, 55, 50, 40, 55, 45, 'bug', null, 'supersonic', 'psybeam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/48.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/48.png'
),
(
    'Venomoth', 70, 65, 60, 90, 75, 90, 'bug', null, 'gust', 'psybeam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/49.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/49.png'
),
(
    'Diglett', 11, 55, 25, 35, 45, 95, 'ground', null, 'sand-attack', 'growl',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/50.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/50.png'
),
(
    'Dugtrio', 35, 110, 50, 50, 70, 120, 'ground', null, 'sand-attack', 'earthquake',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/51.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/51.png'
),
(
    'Meowth', 40, 45, 35, 40, 40, 90, 'normal', null, 'pay-day', 'bite',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/52.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/52.png'
),
(
    'Persian', 65, 70, 60, 65, 65, 115, 'normal', null, 'pay-day', 'fury-swipes',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/53.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/53.png'
),
(
    'Psyduck', 50, 52, 48, 65, 50, 55, 'water', null, 'tail-whip', 'disable',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/54.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/54.png'
),
(
    'Golduck', 80, 82, 78, 95, 80, 85, 'water', null, 'hydro-pump', 'psybeam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/55.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/55.png'
),
(
    'Mankey', 40, 80, 35, 35, 45, 70, 'fighting', null, 'karate-chop', 'thrash',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/56.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/56.png'
),
(
    'Primeape', 65, 115, 60, 60, 70, 95, 'fighting', null, 'thrash', 'seismic-toss',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/57.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/57.png'
),
(
    'Growlithe', 55, 70, 45, 70, 50, 60, 'fire', null, 'take-down', 'leer',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/58.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/58.png'
),
(
    'Arcanine', 90, 110, 80, 110, 80, 95, 'fire', null, 'extreme-speed', 'take-down',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/59.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/59.png'
),
(
    'Poliwag', 40, 50, 40, 40, 40, 90, 'water', null, 'pound', 'double-slap',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/60.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/60.png'
),
(
    'Poliwhirl', 65, 65, 65, 50, 50, 90, 'water', null, 'double-slap', 'body-slam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/61.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/61.png'
),
(
    'Poliwrath', 90, 95, 95, 70, 90, 70, 'water', null, 'mind-reader', 'superpower',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/62.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/62.png'
),
(
    'Abra', 25, 20, 15, 115, 55, 90, 'psychic', null, 'teleport', 'mega-punch',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/63.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/63.png'
),
(
    'Kadabra', 40, 35, 30, 120, 70, 115, 'psychic', null, 'psybeam', 'psychic',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/64.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/64.png'
),
(
    'Alakazam', 55, 50, 45, 135, 95, 120, 'psychic', null, 'psybeam', 'psychic',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/65.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/65.png'
),
(
    'Machop', 70, 80, 50, 35, 35, 35, 'fighting', null, 'leer', 'submission',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/66.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/66.png'
),
(
    'Machoke', 80, 110, 70, 50, 60, 45, 'fighting', null, 'submission', 'seismic-toss',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/67.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/67.png'
),
(
    'Machamp', 90, 130, 80, 65, 85, 55, 'fighting', null, 'submission', 'seismic-toss',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/68.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/68.png'
),
(
    'Bellsprout', 50, 75, 35, 70, 30, 40, 'grass', null, 'slam', 'wrap',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/69.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/69.png'
),
(
    'Weepinbell', 65, 90, 50, 85, 45, 55, 'grass', null, 'slam', 'acid',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/70.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/70.png'
),
(
    'Victreebel', 80, 115, 65, 110, 70, 70, 'grass', null, 'wrap', 'poison-powder',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/71.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/71.png'
),
(
    'Tentacool', 40, 40, 35, 50, 110, 70, 'water', null, 'wrap', 'poison-sting',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/72.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/72.png'
),
(
    'Tentacruel', 80, 70, 65, 80, 120, 110, 'water', null, 'poison-sting', 'water-gun',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/73.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/73.png'
),
(
    'Geodude', 40, 80, 110, 30, 30, 20, 'rock', null, 'sand-attack', 'rock-throw',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/74.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/74.png'
),
(
    'Graveler', 55, 95, 115, 45, 45, 35, 'rock', null, 'rock-throw', 'earthquake',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/75.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/75.png'
),
(
    'Golem', 80, 120, 130, 55, 65, 45, 'rock', null, 'rock-throw', 'earthquake',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/76.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/76.png'
),
(
    'Ponyta', 50, 85, 55, 65, 65, 90, 'fire', null, 'stomp', 'take-down',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/77.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/77.png'
),
(
    'Rapidash', 65, 110, 70, 80, 80, 115, 'fire', null, 'double-kick', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/78.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/78.png'
),
(
    'Slowpoke', 90, 65, 65, 40, 40, 15, 'water', null, 'headbutt', 'growl',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/79.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/79.png'
),
(
    'Slowbro', 95, 75, 110, 110, 80, 30, 'water', null, 'growl', 'water-gun',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/80.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/80.png'
),
(
    'Magnemite', 25, 35, 70, 95, 55, 45, 'electric', null, 'supersonic', 'sonic-boom',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/81.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/81.png'
),
(
    'Magneton', 50, 60, 95, 120, 70, 70, 'electric', null, 'supersonic', 'thunder-wave',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/82.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/82.png'
),
(
    'Farfetchd', 52, 90, 55, 58, 62, 60, 'normal', null, 'swords-dance', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/83.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/83.png'
),
(
    'Doduo', 35, 85, 45, 35, 35, 75, 'normal', null, 'swords-dance', 'wing-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/84.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/84.png'
),
(
    'Dodrio', 60, 110, 70, 60, 60, 110, 'normal', null, 'swords-dance', 'wing-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/85.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/85.png'
),
(
    'Seel', 65, 45, 55, 45, 70, 45, 'water', null, 'take-down', 'growl',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/86.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/86.png'
),
(
    'Dewgong', 90, 70, 80, 70, 95, 70, 'water', null, 'take-down', 'ice-beam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/87.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/87.png'
),
(
    'Grimer', 80, 80, 50, 40, 50, 25, 'poison', null, 'screech', 'harden',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/88.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/88.png'
),
(
    'Muk', 115, 115, 75, 65, 110, 50, 'poison', null, 'screech', 'harden',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/89.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/89.png'
),
(
    'Shellder', 30, 65, 110, 45, 25, 40, 'water', null, 'leer', 'supersonic',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/90.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/90.png'
),
(
    'Cloyster', 50, 95, 180, 85, 45, 70, 'water', null, 'spike-cannon', 'spikes',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/91.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/91.png'
),
(
    'Gastly', 30, 35, 30, 110, 35, 80, 'ghost', null, 'hypnosis', 'dream-eater',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/92.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/92.png'
),
(
    'Haunter', 45, 50, 45, 115, 55, 95, 'ghost', null, 'hypnosis', 'dream-eater',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/93.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/93.png'
),
(
    'Gengar', 60, 65, 60, 130, 75, 110, 'ghost', null, 'hypnosis', 'dream-eater',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/94.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/94.png'
),
(
    'Onix', 35, 45, 160, 30, 45, 70, 'rock', null, 'bind', 'slam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/95.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/95.png'
),
(
    'Drowzee', 60, 48, 45, 43, 90, 42, 'psychic', null, 'headbutt', 'disable',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/96.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/96.png'
),
(
    'Hypno', 85, 73, 70, 73, 115, 67, 'psychic', null, 'headbutt', 'psybeam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/97.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/97.png'
),
(
    'Krabby', 30, 115, 90, 25, 25, 50, 'water', null, 'vice-grip', 'guillotine',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/98.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/98.png'
),
(
    'Kingler', 55, 130, 115, 50, 50, 75, 'water', null, 'guillotine', 'slam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/99.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/99.png'
),
(
    'Voltorb', 40, 30, 50, 55, 55, 110, 'electric', null, 'sonic-boom', 'thunder-shock',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/100.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/100.png'
),
(
    'Electrode', 60, 50, 70, 80, 80, 150, 'electric', null, 'light-screen', 'self-destruct',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/101.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/101.png'
),
(
    'Exeggcute', 60, 40, 80, 60, 45, 40, 'grass', null, 'psybeam', 'leech-seed',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/102.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/102.png'
),
(
    'Exeggutor', 95, 95, 85, 125, 75, 55, 'grass', null, 'stomp', 'leaf-storm',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/103.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/103.png'
),
(
    'Cubone', 50, 50, 95, 40, 50, 35, 'ground', null, 'headbutt', 'thrash',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/104.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/104.png'
),
(
    'Marowak', 60, 80, 110, 50, 80, 45, 'ground', null, 'headbutt', 'thrash',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/105.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/105.png'
),
(
    'Hitmonlee', 50, 120, 53, 35, 110, 87, 'fighting', null, 'mega-kick', 'jump-kick',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/106.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/106.png'
),
(
    'Hitmonchan', 50, 115, 79, 35, 110, 76, 'fighting', null, 'mega-punch', 'fire-punch',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/107.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/107.png'
),
(
    'Lickitung', 90, 55, 75, 60, 75, 30, 'normal', null, 'slam', 'stomp',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/108.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/108.png'
),
(
    'Koffing', 40, 65, 95, 60, 45, 35, 'poison', null, 'smokescreen', 'haze',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/109.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/109.png'
),
(
    'Weezing', 65, 90, 120, 85, 70, 60, 'poison', null, 'smokescreen', 'haze',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/110.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/110.png'
),
(
    'Rhyhorn', 80, 85, 95, 30, 30, 25, 'ground', null, 'stomp', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/111.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/111.png'
),
(
    'Rhydon', 115, 130, 120, 45, 45, 40, 'ground', null, 'horn-drill', 'take-down',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/112.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/112.png'
),
(
    'Chansey', 250, 5, 5, 35, 115, 50, 'normal', null, 'double-edge', 'growl',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/113.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/113.png'
),
(
    'Tangela', 65, 55, 115, 110, 40, 60, 'grass', null, 'slam', 'vine-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/114.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/114.png'
),
(
    'Kangaskhan', 115, 95, 80, 40, 80, 90, 'normal', null, 'mega-punch', 'tail-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/115.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/115.png'
),
(
    'Horsea', 30, 40, 70, 70, 25, 60, 'water', null, 'leer', 'water-gun',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/116.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/116.png'
),
(
    'Seadra', 55, 65, 95, 95, 45, 85, 'water', null, 'leer', 'water-gun',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/117.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/117.png'
),
(
    'Goldeen', 45, 67, 60, 35, 50, 63, 'water', null, 'horn-attack', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/118.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/118.png'
),
(
    'Seaking', 80, 92, 65, 65, 80, 68, 'water', null, 'horn-attack', 'fury-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/119.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/119.png'
),
(
    'Staryu', 30, 45, 55, 70, 55, 85, 'water', null, 'water-gun', 'hydro-pump',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/120.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/120.png'
),
(
    'Starmie', 60, 75, 85, 110, 85, 115, 'water', null, 'confuse-ray', 'tackle',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/121.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/121.png'
),
(
    'Mr Mime', 40, 45, 65, 110, 120, 90, 'psychic', null, 'double-slap', 'psybeam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/122.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/122.png'
),
(
    'Scyther', 70, 110, 80, 55, 80, 115, 'bug', null, 'swords-dance', 'wing-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/123.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/123.png'
),
(
    'Jynx', 65, 50, 35, 115, 95, 95, 'ice', null, 'double-slap', 'ice-punch',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/124.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/124.png'
),
(
    'Electabuzz', 65, 83, 57, 95, 85, 115, 'electric', null, 'thunder-punch', 'low-kick',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/125.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/125.png'
),
(
    'Magmar', 65, 95, 57, 110, 85, 93, 'fire', null, 'fire-punch', 'leer',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/126.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/126.png'
),
(
    'Pinsir', 65, 125, 110, 55, 70, 85, 'bug', null, 'guillotine', 'swords-dance',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/127.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/127.png'
),
(
    'Tauros', 75, 110, 95, 40, 70, 110, 'normal', null, 'stomp', 'horn-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/128.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/128.png'
),
(
    'Magikarp', 20, 11, 55, 15, 20, 80, 'water', null, 'tackle', 'flail',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/129.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/129.png'
),
(
    'Gyarados', 95, 125, 79, 60, 110, 81, 'water', null, 'hyper-beam', 'scary-face',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/130.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/130.png'
),
(
    'Lapras', 130, 85, 80, 85, 95, 60, 'water', null, 'body-slam', 'sing',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/131.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/131.png'
),
(
    'Ditto', 48, 48, 48, 48, 48, 48, 'normal', null, 'tackle', 'transform',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/132.png'
),
(
    'Eevee', 55, 55, 50, 45, 65, 55, 'normal', null, 'double-kick', 'take-down',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/133.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/133.png'
),
(
    'Vaporeon', 130, 65, 60, 110, 95, 65, 'water', null, 'double-kick', 'tail-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/134.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/134.png'
),
(
    'Jolteon', 65, 65, 60, 110, 95, 130, 'electric', null, 'double-kick', 'tail-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/135.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/135.png'
),
(
    'Flareon', 65, 130, 60, 95, 110, 65, 'fire', null, 'double-kick', 'tail-whip',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/136.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/136.png'
),
(
    'Porygon', 65, 60, 70, 85, 75, 40, 'normal', null, 'psybeam', 'thunder-shock',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/137.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/137.png'
),
(
    'Omanyte', 35, 40, 110, 90, 55, 35, 'rock', null, 'sand-attack', 'horn-attack',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/138.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/138.png'
),
(
    'Omastar', 70, 60, 125, 115, 70, 55, 'rock', null, 'leer', 'hydro-pump',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/139.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/139.png'
),
(
    'Kabuto', 30, 80, 90, 55, 45, 55, 'rock', null, 'sand-attack', 'leer',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/140.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/140.png'
),
(
    'Kabutops', 60, 115, 115, 65, 70, 80, 'rock', null, 'sand-attack', 'leer',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/141.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/141.png'
),
(
    'Aerodactyl', 80, 115, 65, 60, 75, 130, 'rock', null, 'take-down', 'bite',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/142.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/142.png'
),
(
    'Snorlax', 160, 110, 65, 65, 110, 30, 'normal', null, 'body-slam', 'double-edge',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/143.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/143.png'
),
(
    'Articuno', 90, 85, 110, 95, 125, 85, 'ice', null, 'leer', 'mist',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/144.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/144.png'
),
(
    'Zapdos', 90, 90, 85, 125, 90, 110, 'electric', null, 'leer', 'thunder',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/145.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/145.png'
),
(
    'Moltres', 90, 110, 90, 125, 85, 90, 'fire', null, 'leer', 'flamethrower',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/146.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/146.png'
),
(
    'Dratini', 41, 64, 45, 50, 50, 50, 'dragon', null, 'slam', 'hyper-beam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/147.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/147.png'
),
(
    'Dragonair', 61, 84, 65, 70, 70, 70, 'dragon', null, 'slam', 'hyper-beam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/148.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/148.png'
),
(
    'Dragonite', 91, 134, 95, 110, 110, 80, 'dragon', null, 'wing-attack', 'slam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/149.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/149.png'
),
(
    'Mewtwo', 116, 110, 90, 154, 90, 130, 'psychic', null, 'mist', 'psybeam',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/150.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/150.png'
),
(
    'Mew', 110, 110, 110, 110, 110, 110, 'psychic', null, 'mega-punch', 'psychic',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/151.png',
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/back/151.png'
)
;
