const express = require("express");
const users = express.Router();
const usersArray = require("../models/users.js");
const { getAllUsers, getUser, createUser, deleteUser } = require("../queries/users")

const { validateUrl } = require('../models/validations')


// INDEX
users.get("/", async (req, res) => {

    try {
        const allUsers = await getAllUsers();
        console.log(allUsers)
        res.status(200).json(allUsers);
    } catch(err) {
        res.status(500).json({ error: err.message});
    }

});

// SHOW
users.get("/:uuid", async (req, res) => {
    const { uuid } = req.params;

    try {
        const user = await getUser(uuid);
        res.status(200).json(user);
    } catch(err) {
        res.status(500).json({ error: err.message });
    }
});

// CREATE
users.post("/", async (req, res) => {
    const user = req.body;

    try {
        const newUser = await createUser(user);
        res.status(200).json(newUser);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// DELETE
users.delete("/:uuid", async (req, res) => {
    const { uuid } = req.params;

    try {
        const deletedUser = await deleteUser(uuid);
        res.status(200).json(deletedUser);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
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