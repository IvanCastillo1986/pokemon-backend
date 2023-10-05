const express = require("express");
const users = express.Router();
const { getAllUsers, getUser, createUser, deleteUser } = require("../queries/users")
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
    let userDeck;
    let userPokemon;

    try {
        userDeck = await getDecksById(uuid);
        userPokemon = await getAllPokemonInDeck(uuid);
    } catch(err) {
        res.status(500).json({ errorGettingDecksOrPokemonById: err.message });
    }

    try {
        const user = await getUser(uuid);
        res.status(200).json({ user, userDeck, userPokemon });
    } catch(err) {
        res.status(500).json({ errorGettingUser: err.message });
    }
});

// CREATE
users.post("/", async (req, res) => {
    // This should not only create a new user, but also create a new deck with random Pokemon for that user
    const user = req.body[0];
    const starterDeckArr = req.body[1];
    let pokemonDeckArr = [];

    // here we add each pokemon from starterDeckArr into Decks table
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
        res.status(200).json({ user: newUser, userDeck: pokemonDeckArr, userPokemon });
    } catch(err) {
        res.status(400).json({ errorCreatingUser: err.message });
    }
});

// DELETE
users.delete("/:uuid", async (req, res) => {
    const { uuid } = req.params;

    // will also delete every deck attached to uuid


    try {
        await deleteDeck(uuid);

        const deletedUser = await deleteUser(uuid);
        res.status(200).json(deletedUser);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// DELETE
// users.delete("/:index", (req, res, next) => {
//     const { index } = req.params
//     console.log(`User ${index} has just been deleted`)
//     const deletedUser = usersArray.splice(index, 1)

//     if (index) {
//         res.json(deletedUser)
//     } else {
//         res.status(400).json({ error: "Student not found" })
//     }
// });

// UPDATE
// users.put("/:index", (req, res) => {
//     const {index} = req.params
    
//     if (usersArray[index]) {
//         const updatedUser = req.body
//         usersArray[index] = updatedUser
        
//         res.status(200).json(usersArray[index])
//     } else {
//         res.status(400).json({ error: 'student index not found'})
//     }
// });


module.exports = users;