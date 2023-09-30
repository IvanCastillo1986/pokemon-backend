const db = require('../db/dbConfig');


const getAllPokemon = async () => {
    const allPokemon = await db.any("SELECT * FROM pokemon");
    return allPokemon;
};

const getPokemon = async (id) => {
    const onePokemon = await db.one("SELECT * FROM pokemon WHERE id = $1", id);
    return onePokemon;
}

const deletePokemon = async (id) => {
    const deletedPokemon = await db.one("DELETE FROM pokemon WHERE id = $1", id);
    return deletedPokemon;
}


module.exports = { getAllPokemon, getPokemon, deletePokemon };