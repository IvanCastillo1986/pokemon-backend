const express = require("express");
const pokemon = express.Router();
const { getAllPokemon, getPokemon, deletePokemon, getAllPokemonInDeck } = require('../queries/pokemon');


// Index
pokemon.get("/", async (req, res) => {

    // if I don't render this conditionally, it will break the server because JSON.parse will be used on undefined
    const pokemonIds = req.query.pokemonIds ? JSON.parse(req.query.pokemonIds) : null;
    const { uuid } = req.query;

    try {
        if (pokemonIds) {
            const pokemonArr = [];
            
            for (const id of pokemonIds) {
                const pokemon = await getPokemon(id);
                pokemonArr.push(pokemon);
            }

            res.status(200).json(pokemonArr);
        } else if (uuid) {
            const allPokemonInDeck = await getAllPokemonInDeck(uuid);
            
            res.status(200).json(allPokemonInDeck);
        } else {
            const allPokemon = await getAllPokemon();

            res.status(200).json(allPokemon);
        }
    } catch(err) {
        res.status(500).json({ error: err });
    }
});

// Show
pokemon.get("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const onePokemon = await getPokemon(id);
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