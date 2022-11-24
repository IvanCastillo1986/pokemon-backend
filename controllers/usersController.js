const express = require("express");
const users = express.Router();
const usersArray = require("../models/users.js");

const { validateUrl } = require('../models/validations')


// SHOW
users.get("/", (req, res) => {
    res.json(usersArray);
});

// SHOW BY ID
users.get("/:first_name", (req, res) => {
    const { first_name } = req.params;
    let searchedUser;
    console.log(first_name);
    console.log(usersArray);
    for (const user of usersArray) {
        if (user.first_name === first_name) {
            searchedUser = user;
        }
    }
    if (searchedUser) {
        res.status(200).json(searchedUser);
    } else {
        res.status(404).send("Could not find user " + first_name);
    }
});

// CREATE
users.post("/", validateUrl, (req, res) => {
    console.log(req.body);

    usersArray.push(req.body)
    res.json(usersArray[usersArray.length - 1])
});


module.exports = users;