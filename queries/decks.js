const db = require("../db/dbConfig");


const getAllDecks = async () => {
    const allDecks = await db.any("SELECT * FROM decks");
    return allDecks;
};

const getDeck = async (id) => {
    const oneDeck = await db.one("SELECT * FROM decks WHERE id = $1", id);
    return oneDeck;
};

const getDeckByUserId = async (uuid) => {
    const oneDeck = await db.one("SELECT * FROM decks WHERE user_id = $1", uuid);
    return oneDeck;
};

// gets used in usersController when creating a new user. 
// creates a new deck pokemon in Decks table for each pokemonId in array
const createDeck = async (user_id, pokemon_id) => {
    const newDeck = await db.one(
        "INSERT INTO decks (user_id, pokemon_id) VALUES ($1, $2) RETURNING *",
        [user_id, pokemon_id]
    );
    return newDeck;
};

const deleteDeck = async (uuid) => {
    const deletedDeck = await db.any("DELETE FROM decks WHERE user_id = $1 RETURNING *", uuid);
    return deletedDeck;
};

const updateDeck = async (deckId, deck) => {
    const updatedDeck = await db.one(
        "UPDATE decks SET user_id=$1, pokemon_id=$2, exp=$3, lvl=$4 WHERE id=$5 RETURNING *",
        [deck.uuid, deck.pokemon_id, deck.exp, deck.lvl, deckId]
    );
    return updatedDeck;
};

const updateDeckWithGainedExp = async (deckId, exp) => {
    const updatedDeck = await db.one(
        "UPDATE decks SET exp=exp+$1 WHERE id=$2 RETURNING *",
        [exp, deckId]
    );
    return updatedDeck;
};

const updateDeckWithCurrentExpAndLvl = async (deckObj) => {
    const updatedDeck = await db.one(
        "UPDATE decks SET exp=$1, lvl=$2 WHERE id=$3 RETURNING *",
        [deckObj.exp, deckObj.lvl, deckObj.id]
    );
    return updatedDeck;
};



module.exports = { getAllDecks, getDeck, getDeckByUserId, createDeck, deleteDeck, updateDeck, updateDeckWithCurrentExpAndLvl };