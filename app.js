// DEPENDENCIES
const express = require('express');
const pokemon = require('./models/pokemon');
const pokemonController = require('./controllers/pokemonController');
const usersController = require("./controllers/usersController");

// CONFIGURATION
const app = express();

app.use(express.json()); // This is Express's built-in method to parse incoming JSON
app.use("/pokemon", pokemonController);
app.use("/users", usersController);

// Routes are like event listeners in the browser
// ROUTES
app.get("/", (req, res) => {
    res.send("New Pokemon Full Stack comin' atcha. Gotta catch 'em all!");
});

app.get("/pokemon/awesome", (req, res) => {
    res.send(`
    <h1>Rocks are awesome!</h1>
    <h2>(You can totally write HTML into an Express route if you use backticks, and don't even need to use closing tag) 
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Bismuth_crystal_macro.jpg/800px-Bismuth_crystal_macro.jpg" >
  `);
});

// You can only have one response for every request - HTTP rule
app.get("/pokemon/:index", (req, res) => {
    const { index } = req.params;

    if (pokemon[index]) {
        res.send(pokemon[index]);
    } else {
        res.status(400).send(`Could not find any Pokemon at index ${index}`);
    }
});

// ERROR ROUTE
app.get("*", (req, res) => {
    res.status(404).json({error: "Page not found"});
});


// EXPORT
module.exports = app;