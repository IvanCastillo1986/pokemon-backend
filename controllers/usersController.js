const express = require("express");
const users = express.Router();
const { getAllUsers, getUser, createUser, updateUser, deleteUser } = require("../queries/users")
const { getDecksById, createDeck, deleteDeck } = require("../queries/decks.js")
const { getAllPokemonInDeck } = require("../queries/pokemon.js")
const { createBagItem, getItemsInBag } = require("../queries/bags.js")
const { getItem } = require("../queries/items.js");

const { validateUrl } = require('../models/validations');


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
// Responds back with { user{}, userPokemon[], userItems[] }
users.get("/:uuid", async (req, res) => {
    const { uuid } = req.params;
    let userPokemon;
    let userItems;

    try {
        userPokemon = await getAllPokemonInDeck(uuid);
    } catch(err) {
        console.log('errorGettingDeckOrPokemon:', err.message);
    }

    // ToDo: collect all of user's items by joining bags and items table ON user_items WHERE user_id = uuid
    try {
        // Get bagIds first [{user_id, item_id}, ...] => [{item_id}, ...]
        userItems = await getItemsInBag(uuid);
        // NOTE: quantity of items will be calculated and converted back in front-end before POSTing to back-end
    } catch(err) {
        console.log("errorGettingUserBag:", err.message);
    }

    try {
        const user = await getUser(uuid);
        res.status(200).json({ user, userPokemon, userItems });
    } catch(err) {
        res.status(500).json({ errorGettingUser: err.message });
    }
}); 


// This creates a user with default item (potion)
users.post("/", async (req, res) => {
    // This not only creates a new user, but also create a new deck with random Pokemon for that user
    // Also adds new item (potion)
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

    // This adds a default potion to user's bag
    // newBagItem = await createBagItem({user_id: user.uuid, item_id: 1})
    try {
        const newItem = await createBagItem({user_id: user.uuid, item_id: 1});
        const newUser = await createUser(user);
        const userPokemon = await getAllPokemonInDeck(newUser.uuid);
        // console.log('userPokemon:', userPokemon)

        // the deck's exp/lvl properties from pokemonDeckArr are attacked to each pokemon in front-end
        // deck:  {id: 1, user_id: "7XzFvOUVS4eQHGI8ClxNbN7qY7b2", pokemon_id: 10, exp: 0, lvl: 1}
        // pokemon: {id:10, name: "Caterpie"...} 
        // => {id:10, name: "Caterpie"..., exp: 0, lvl: 1}
        res.status(200).json({ 
            // status: 'OK',
            user: newUser, 
            userPokemon, 
            userItems: [
                {
                "id": newItem.id,
                "item_id": 1,
                "item_name": "potion",
                "effect": null,
                "hp_restored": 20,
                "pp_restored": null,
                "item_desc": "Restores 20 hp"
            }
            ]
        });
    } catch(err) {
        res.status(400).json({ errorCreatingUser: err.message });
    }
});

// UPDATE
users.put("/:uuid", async (req, res) => {
    const { uuid } = req.params;
    const user = req.body;
    const { getPokemon } = req.query;
    
    /* ToDo:
    add query to update every deck sent from front-end after user wins
    After updating decks, THEN getAllPokemonInDeck()
    decks from front-end come in an array, along with winningUser object
    
    Return deck data to front-end combined with Pokemon.
    */

    try {
        if (getPokemon) {
            const updatedUserPokemon = await getAllPokemonInDeck(uuid);
            const updatedUser = await updateUser(uuid, user);
            const updatedItems = await getItemsInBag(uuid);
            
            res.status(200).json({ updatedUser, updatedUserPokemon, updatedItems });
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