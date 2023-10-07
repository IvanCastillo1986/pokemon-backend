const db = require('../db/dbConfig');


const getAllPokemon = async () => {
    const allPokemon = await db.any("SELECT * FROM pokemon");
    return allPokemon;
};

const getPokemon = async (id) => {
    const onePokemon = await db.one("SELECT * FROM pokemon WHERE id = $1", id);
    return onePokemon;
};

const deletePokemon = async (id) => {
    const deletedPokemon = await db.one("DELETE FROM pokemon WHERE id = $1", id);
    return deletedPokemon;
};

const getAllPokemonInDeck = async (user_id) => {
    // This returns both pokemon AND deck data, so that we can do it all in one query
    // Also, in usersController, we return to front-end the pokemon and deck in one item
    // This way, the front-end has access to exp and lvl within each pokemon object
    const allPokemonInDeck = await db.any(
        "SELECT * FROM pokemon \
        LEFT JOIN decks ON pokemon.id = decks.pokemon_id \
        WHERE decks.user_id = $1",
        [user_id]
    );
    return allPokemonInDeck;
};


module.exports = { getAllPokemon, getPokemon, deletePokemon, getAllPokemonInDeck };