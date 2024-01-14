const express = require("express");
const dvs = express.Router();
const { getAllDvs, getDv, createDv, deleteDv, updateDv } = require("../queries/dvs");


// Index
dvs.get("/", async (req, res) => {
    
    try {
        const allDvs = await getAllDvs();
        res.status(200).json(allDvs);
    } catch(err) {
        res.status(500).json({ errorGettingDvs: err.message });
    }
});

// Show
dvs.get("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const dv = await getDv(id);
        res.status(200).json(dv);
    } catch(err) {
        res.status(500).json({ errorGettingOneDv: err.message });
    }
});

// Create
dvs.post("/", async (req, res) => {
    const dv = req.body;

    try {
        const newDv = await createDv(dv);
        res.status(200).json(newDv);
    } catch(err) {
        res.status(500).json({ errorCreatingDv: err.message });
    }
});

// Delete
dvs.delete("/:id", async (req, res) => {
    const { id } = req.params;

    try {
        const deletedDv = await deleteDv(id);
        res.status(200).json(deletedDv);
    } catch(err) {
        res.status(500).json({ errorDeletingDv: err.message });
    }
});

// Update
dvs.put("/:id", async (req, res) => {
    const { id } = req.params;
    const dv = req.body;

    try {
        const updatedDv = await updateDv(id, dv);
        res.status(200).json(updatedDv);
    } catch(err) {
        res.status(500).json({ errorUpdatingDv: err.message });
    }
});


module.exports = dvs;