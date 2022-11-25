const express = require("express");
const users = express.Router();
const usersArray = require("../models/users.js");

const { validateUrl } = require('../models/validations')


// SHOW
users.get("/", (req, res) => {
    res.json(usersArray);
});

// SHOW BY INDEX
users.get("/:index", (req, res) => {
    const { index } = req.params

    if (usersArray[index]) {
        res.status(200).json(usersArray[index])
    } else {
        res.status(400).json({ error: "User not found. Check your index and try again"})
    }
});

// SHOW BY NAME
users.get("/:first_name", (req, res) => {
    const { first_name } = req.params;
    let searchedUser;

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

// DELETE
users.delete("/:index", (req, res, next) => {
    const { index } = req.params
    console.log(`User ${index} has just been deleted`)
    const deletedUser = usersArray.splice(index, 1)

    if (index) {
        res.json(deletedUser)
    } else {
        res.status(400).json({ error: "Student not found" })
    }
});

// UPDATE
users.put("/:index", (req, res) => {
    const {index} = req.params
    
    if (usersArray[index]) {
        const updatedUser = req.body
        usersArray[index] = updatedUser
        
        res.status(200).json(usersArray[index])
    } else {
        res.status(400).json({ error: 'student index not found'})
    }
});


module.exports = users;