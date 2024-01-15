const express = require("express");
const decks = express.Router();
const { getAllDecks, getDeck, createDeck, deleteDeck, updateDeck } = require("../queries/decks");
const { getStarterInDeck } = require("../queries/pokemon");
const { assignDVs, raisePokemonStats } = require("../helpers/assignDVs.js");
const { createDv } = require("../queries/dvs.js");


// INDEX
decks.get("/", async (req, res) => {

    try {
        const allDecks = await getAllDecks();
        res.status(200).json(allDecks);
    } catch(err) {
        res.status(500).json({ error: err.message});
    }
});

// SHOW
decks.get("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const deck = await getDeck(id);
        res.status(200).json(deck);
    } catch(err) {
        res.status(500).json({ error: err.message });
    }
});

// CREATE
decks.post("/", async (req, res) => {
    const { uuid, pokemonId } = req.body;
    const { getPokeInfo } = req.query;

    try {
        if (getPokeInfo) {
            await createDeck(uuid, pokemonId);
            const pokemonAndDeck = await getStarterInDeck(uuid, pokemonId)
        
            // create DVs and raise Pokemon's stats
            const pokemonDVs = [];
            const randomDVs = assignDVs(pokemonAndDeck);
            const dv = await createDv(randomDVs);
            pokemonDVs.push(dv);

            raisePokemonStats([pokemonAndDeck], pokemonDVs);

            res.status(200).json(pokemonAndDeck)
        } else {
            const newDeck = await createDeck(uuid, pokemonId);
            res.status(200).json(newDeck);
        }
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// DELETE
decks.delete("/:uuid", async (req, res) => {
    const { uuid } = req.params;

    try {
        const deletedDeck = await deleteDeck(uuid);
        res.status(200).json(deletedDeck);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// UPDATE
decks.put("/:deckId", async (req, res) => {
    const { deckId } = req.params;
    const deck = req.body;
    const { expAdded } = req.query;
    
    try {
        if (expAdded) {
            deck.exp = deck.exp + Number(expAdded)
        }
        const updatedDeck = await updateDeck(deckId, deck);
        res.status(200).json(updatedDeck);
    } catch(err) {
        res.status(500).json({ errorUpdatingDecks: err.message});
    }
});


module.exports = decks;