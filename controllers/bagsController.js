const express = require("express");
const bags = express.Router();
const { getAllBags, getBagItems, getBagByUserId, createBagItem, deleteBagItemByBagId, deleteUserBag, updateBag } = require("../queries/bags")


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
    // Check if id is a String(uuid, getBagItems) or a Number(id, getBagByUserId)
    const { id } = req.params;

    try {
        if (isNaN(id)) {
            const bag = await getBagByUserId(id);
            res.status(200).json(bag);
        } else {
            const bag = await getBagItems(id);
            res.status(200).json(bag);
        }
    } catch(err) {
        res.status(500).json({ error: err.message });
    }
});

// CREATE
// bags.post("${API}/bags", bagItem)
bags.post("/", async (req, res) => {
    const bagItem = req.body;

    try {
        const newBagItem = await createBagItem(bagItem);
        res.status(200).json(newBagItem);
    } catch(err) {
        res.status(400).json({ error: err.message });
    }
});

// DELETE
bags.delete("/:uuid", async (req, res) => {
    // Deletes all items from a User's bag
    const { uuid } = req.params;
    // Deletes one item from a User's bag
    const { bagId } = req.query;

    try {
        if (bagId) {
            const deletedBagItem = await deleteBagItemByBagId(bagId);
            res.status(200).json(deletedBagItem);
        } else {
            const deletedBag = await deleteUserBag(uuid);
            res.status(200).json(deletedBag);
        }
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