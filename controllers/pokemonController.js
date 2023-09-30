const express = require("express");
const pokemon = express.Router();
const { getAllPokemon, getPokemon, deletePokemon } = require('../queries/pokemon');


// Index
pokemon.get("/", async (req, res) => {
    
    try {
        const allPokemon = await getAllPokemon();
        res.status(200).json(allPokemon);
    } catch(err) {
        res.status(500).json({ error: err.message });
    }
});

// Show
pokemon.get("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const onePokemon = await getPokemon(id)
        res.status(200).json(onePokemon);
    } catch(err) {
        res.status(404).json({ error: err.message });
    }
});

// Delete
pokemon.delete("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const deletedPokemon = await deletePokemon(id);
        res.status(200).json(deletedPokemon);
    } catch(err) {
        res.status(404).json({ error: err.message });
    }
});


module.exports = pokemon;