const express = require("express");
const pokemon = express.Router();
const pokemonArray = require("../models/pokemon.js");


pokemon.get("/", (req, res) => {
    console.log('using router');
    res.json(pokemonArray);
});

module.exports = pokemon;