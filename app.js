// DEPENDENCIES
const express = require('express');
const pokemon = require('./pokemon');

// CONFIGURATION
const app = express();

// Routes are like event listeners in the browser
// ROUTES
app.get("/", (req, res) => {
    res.send("New Pokemon Full Stack comin' atcha!");
});

app.get("/pokemon", (req, res) => {
    res.send(pokemon)
});

// EXPORT
module.exports = app;