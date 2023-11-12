const express = require("express");
const users = express.Router();
const { getAllUsers, getUser, createUser, updateUser, deleteUser } = require("../queries/users")
const { getDecksById, createDeck, deleteDeck } = require("../queries/decks.js")
const { getAllPokemonInDeck } = require("../queries/pokemon.js")

const { validateUrl } = require('../models/validations')


// INDEX
users.get("/", async (req, res) => {

    try {
        const allUsers = await getAllUsers();
        res.status(200).json(allUsers);
    } catch(err) {
        res.status(500).json({ error: err.message});
    }

});

// SHOW
users.get("/:uuid", async (req, res) => {
    const { uuid } = req.params;
    let userPokemon;

    try {
        userPokemon = await getAllPokemonInDeck(uuid);
    } catch(err) {
        res.status(500).json({ errorGettingDecksOrPokemonById: err.message });
    }

    try {
        const user = await getUser(uuid);
        res.status(200).json({ user, userPokemon });
    } catch(err) {
        res.status(500).json({ errorGettingUser: err.message });
    }
});

// CREATE
users.post("/", async (req, res) => {
    // This not only creates a new user, but also create a new deck with random Pokemon for that user
    const user = req.body[0];
    const starterDeckArr = req.body[1];
    let pokemonDeckArr = [];

    try {
        for (let pokemonId of starterDeckArr) {
            const pokemonAddedToDeck = await createDeck(user.uuid, pokemonId);
            pokemonDeckArr.push(pokemonAddedToDeck);
        }
    } catch(err) {
        res.status(500).json({ errorAddingNewDeck: err.message });
    }


    try {
        const newUser = await createUser(user);
        const userPokemon = await getAllPokemonInDeck(newUser.uuid);

        // the deck's exp/lvl properties from pokemonDeckArr are attacked to each pokemon in front-end
        // deck:  {id: 1, user_id: "7XzFvOUVS4eQHGI8ClxNbN7qY7b2", pokemon_id: 10, exp: 0, lvl: 1}
        // pokemon: {id:10, name: "Caterpie"...} => {id:10, name: "Caterpie"..., exp: 0, lvl: 1}

        res.status(200).json({ user: newUser, userPokemon });
    } catch(err) {
        res.status(400).json({ errorCreatingUser: err.message });
    }
});

// UPDATE
users.put("/:uuid", async (req, res) => {
    const { uuid } = req.params;
    const user = req.body;
    const { getPokemon } = req.query;

    try {
        if (getPokemon) {
            const updatedUserPokemon = await getAllPokemonInDeck(uuid);
            const updatedUser = await updateUser(uuid, user);
            
            res.status(200).json({ updatedUser, updatedUserPokemon });
        } else {
            const updatedUser = await updateUser(uuid, user);
            res.status(200).json(updatedUser);
        }
    } catch(err) {
        res.status(404).json({ errorUpdatingUser: err.message });
    }
});

// DELETE
users.delete("/:uuid", async (req, res) => {
    const { uuid } = req.params;

    // will also delete every deck attached to uuid
    try {
        const deletedDeck = await deleteDeck(uuid);
        const deletedUser = await deleteUser(uuid);
        res.status(200).json({ deletedUser, deletedDeck });
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});



module.exports = users;