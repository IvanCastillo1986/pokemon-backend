const express = require("express");
const dvs = express.Router();
const { getAllDvs, getDv, createDv, deleteDv, updateDv } = require("../queries/dvs");
const { assignDVs } = require("../helpers/assignDVs")


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
// Recieves pokemonArr, and creates DVs for each Pokemon in array
dvs.post("/", async (req, res) => {
    const { fullDeck, dvs } = req.body;

    try {
        if (fullDeck) {
            // assign random DVs to each Pokemon, then add DVs to
            const pokemonDVs = [];
            const createdDVs = [];
            for (const pokemon of fullDeck) {
                const dvObj = assignDVs(pokemon);
                pokemonDVs.push(dvObj);
            }
            
            for (const dvObj of pokemonDVs) {
                const createdDV = await createDv(dvObj);
                createdDVs.push(createdDV);
            }
            console.log('createdDVs', createdDVs)
            console.log('pokemonDVs', pokemonDVs)
            res.status(200).json(pokemonDVs);
        } else if (Array.isArray(dvs)) {
            const newDvsArr = [];
            for (const dv of dvs) {
                const newDv = await createDv(dv);
                newDvsArr.push(newDv);
            }
            res.status(200).json(newDvsArr);
        } else {
            const newDv = await createDv(dvs);
            res.status(200).json(newDv);
        }
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