const express = require("express");
const bags = express.Router();
const { getAllBags, getBagItem, getBagByUserId, createBag, deleteBag, updateBag } = require("../queries/bags")


// INDEX
bags.get("/", async (req, res) => {

    try {
        const allBags = await getAllBags();
        res.status(200).json(allBags);
    } catch(err) {
        res.status(500).json({ error: err.message});
    }
});

// SHOW
bags.get("/:id", async (req, res) => {
    // Check if id is a String(uuid, getBagItem) or a Number(id, getBagByUserId)
    const { id } = req.params;

    try {
        if (isNaN(id)) {
            const bag = await getBagByUserId(id);
            res.status(200).json(bag);
        } else {
            const bag = await getBagItem(id);
            res.status(200).json(bag);
        }
    } catch(err) {
        res.status(500).json({ error: err.message });
    }
});

// CREATE
bags.post("/", async (req, res) => {
    const bagItem = req.body;
    console.log(bagItem)

    try {
        const newBagItem = await createBag(bagItem);
        res.status(200).json(newBagItem);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// DELETE
bags.delete("/:uuid", async (req, res) => {
    // Deletes all items from a User's bag
    const { uuid } = req.params;

    try {
        const deletedBag = await deleteBag(uuid);
        console.log(deletedBag)
        res.status(200).json(deletedBag);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// UPDATE
bags.put("/:bagId", async (req, res) => {
    const { bagId } = req.params;
    const bag = req.body;
    
    try {
        const updatedBag = await updateBag(bagId, bag);
        res.status(200).json(updatedBag);
    } catch(err) {
        res.status(500).json({ errorUpdatingBags: err.message});
    }
});


module.exports = bags;