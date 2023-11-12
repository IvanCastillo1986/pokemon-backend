const express = require("express");
const items = express.Router();
const { getAllItems, getItem, createItem, deleteItem, updateItem } = require("../queries/items");


// Index
items.get("/", async (req, res) => {
    
    try {
        const allItems = await getAllItems();
        res.status(200).json(allItems);
    } catch(err) {
        res.status(500).json({ errorGettingItems: err.message });
    }
});

// Show
items.get("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const item = await getItem(id);
        res.status(200).json(item);
    } catch(err) {
        res.status(500).json({ errorGettingOneItem: err.message });
    }
});

// Create
items.post("/", async (req, res) => {
    const item = req.body;

    try {
        const newItem = await createItem(item);
        res.status(200).json(newItem);
    } catch(err) {
        res.status(500).json({ errorCreatingItem: err.message });
    }
});

// Delete
items.delete("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const deletedItem = await deleteItem(id);
        res.status(200).json(deletedItem);
    } catch(err) {
        res.status(500).json({ errorDeletingItem: err.message });
    }
});

// Update
items.put("/:id", async (req, res) => {
    const { id } = req.params;
    const item = req.body;

    try {
        const updatedItem = await updateItem(id, item);
        res.status(200).json(updatedItem);
    } catch(err) {
        res.status(500).json({ errorUpdatingItem: err.message });
    }
});


module.exports = items;