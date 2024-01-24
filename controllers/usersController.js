const express = require("express");
const users = express.Router();
const { getAllUsers, getUser, createUser, updateUser, deleteUser } = require("../queries/users")
const { createDeck, deleteDeck, updateDeckWithCurrentExpAndLvl } = require("../queries/decks.js")
const { getAllPokemonInDeck } = require("../queries/pokemon.js")
const { createBagItem, getItemsInBag, deleteBagItemByBagId } = require("../queries/bags.js")
const { getItem } = require("../queries/items.js");
const { getPokemonDvs, createDv} = require("../queries/dvs.js")
const { assignDVs, raisePokemonStats } = require("../helpers/assignDVs.js")



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
    // called from 
    const { uuid } = req.params;
    let userPokemon;
    let userItems;

    try {
        userPokemon = await getAllPokemonInDeck(uuid);
        
        // get DVs for all userPokemon
        for (const pokemon of userPokemon) {
            pokemon.pokemonDVs = await getPokemonDvs(pokemon.id);
        }

        // raisePokemonStats(userPokemon);
    } catch(err) {
        console.log('errorGettingDeckOrPokemon:', err);
    }

    try {
        // Get bagIds first [{user_id, item_id}, ...] => [{item_id}, ...]
        userItems = await getItemsInBag(uuid);
        // NOTE: quantity of items will be calculated and converted back in front-end before POSTing to back-end
    } catch(err) {
        console.log("errorGettingUserBag:", err);
    }

    try {
        const user = await getUser(uuid);
        res.status(200).json({ user, userPokemon, userItems });
    } catch(err) {
        res.status(500).json({ errorGettingUser: err });
    }
});

// This creates a user with default item (potion) and creates permanent DVs for each newly created deck/pokemon
users.post("/", async (req, res) => {


    // This not only creates a new user, but also create a new deck with random Pokemon for that user
    // Also adds new item (potion), and creates permanent DVs for each Pokemon
    const user = req.body;

    // This adds a default potion to user's bag
    // newBagItem = await createBagItem({user_id: user.uuid, item_id: 1})
    try {
        const newItem = await createBagItem({user_id: user.uuid, item_id: 1});
        const newUser = await createUser(user);
        const userPokemon = [];

        console.log('created new user at <Register />:', { 
            user: newUser, 
            userPokemon, 
            userItems: [{
                "id": newItem.id,
                "item_id": 1,
                "item_name": "potion",
                "effect": null,
                "hp_restored": 20,
                "pp_restored": null,
                "item_desc": "Restores 20 hp"
            }]
        })
        
        res.status(200).json({ 
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
        res.status(400).json({ errorCreatingUser: err });
    }
});

// UPDATE
users.put("/:uuid", async (req, res) => {
    // if we're calling from declareWinner:
        // we're removing and adding items
        // updating decks with exp
        // getting pokemon, DVs and converting Pokemon
    // if we're calling from <Deck />
        // we're adding current ids to Deck 
        // getting user
        // getting Pokemon
        // getting items
    const { uuid } = req.params;
    // Add {deckObjToUpdate} below after it's being sent by front-end
    const { userToUpdate, bagIdsFromGame, wonItemId, deckArrToUpdate, pokemonIds } = req.body;
    const { matchEnd } = req.query;

    try {
        if (pokemonIds) {
            // This route creates the rest of user data (deck, pokemonDVs, etc.)
            
            // creates new user decks, then gets new pokemon+decks
            for (const pokeId of pokemonIds) {
                await createDeck(uuid, pokeId);
            }
            const userPokemon = await getAllPokemonInDeck(uuid);
            const userItems = await getItemsInBag(uuid);
            
            for (const pokemon of userPokemon) {
                const randomDVs = assignDVs(pokemon);
                pokemon.pokemonDVs = await createDv(randomDVs);
            }
            
            // console.log('returning user to <Decks />:', {user: userToUpdate, userPokemon, userItems})
            res.status(200).json({user: userToUpdate, userPokemon, userItems});
        } else if (matchEnd) {
            // bagItem: { id, user_id, item_id, item_name, effect, hp_restored, pp_restored, item_desc }
            // Add the newly won item to bags table
            const newBag = await createBagItem({user_id: uuid, item_id: wonItemId});
            const newItem = await getItem(newBag.item_id);
            const newBagItem = {...newItem, ...newBag};

            // add new item to bagIdsFromGame
            bagIdsFromGame.push(newBagItem.id);

            // add bagItem to userItems array to return to user
            const userItems = [];
            
            // get current items in bag
            const itemsInBagFromTable = await getItemsInBag(uuid);
            
            // add each {...bag, ...item} that hasn't been used in game to userItems
            for (const itemInBag of itemsInBagFromTable) {
                if (bagIdsFromGame.includes(itemInBag.id)) {
                    userItems.push(itemInBag);
                } else {
                    await deleteBagItemByBagId(itemInBag.id);
                }
            }


            // updates applicable decks with exp and lvls in deck array
            for (const deckObj of deckArrToUpdate) {
                await updateDeckWithCurrentExpAndLvl(deckObj);
            }

            const user = await updateUser(uuid, userToUpdate);
            const userPokemon = await getAllPokemonInDeck(uuid);
            
            // get all user pokemon's DVs
            for (const pokemon of userPokemon) {
                pokemon.pokemonDVs = await getPokemonDvs(pokemon.id);
            }
            
            res.status(200).json({ user, userPokemon, userItems });
        } else {
            const user = await updateUser(uuid, userToUpdate);
            const userItems = await getItemsInBag(uuid);
            const userPokemon = await getAllPokemonInDeck(uuid);
            for (const pokemon of userPokemon) {
                const randomDVs = assignDVs(pokemon);
                pokemon.pokemonDVs = await createDv(randomDVs);
            }

            // console.log('user at end of .put():', {user, userPokemon, userItems})
            res.status(200).json({ user, userPokemon, userItems });
        }
    } catch(err) {
        res.status(400).json({ errorUpdatingUser: err });
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
        res.status(400).json({ error: err });
    }
});


module.exports = users;