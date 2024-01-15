const db = require("../db/dbConfig");


const getAllDvs = async () => {
    const allDvs = await db.any("SELECT * FROM dvs");
    return allDvs;
};

const getDv = async (id) => {
    const dv = await db.one("SELECT * FROM dvs WHERE id = $1", id);
    return dv;
};

const getPokemonDvs = async (deckId) => {
    const dv = await db.one("SELECT * FROM dvs WHERE deck_id = $1", deckId);
    return dv;
};

const createDv = async (dv) => {
    const newDv = await db.one(
        "INSERT INTO dvs (deck_id, hp_dv, atk_dv, def_dv, special_atk_dv, special_def_dv, speed_dv) \
        VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *", 
        [dv.deckId, dv.hp_dv, dv.atk_dv, dv.def_dv, dv.special_atk_dv, dv.special_def_dv, dv.speed_dv]
    );
    return newDv;
};

const deleteDv = async (id) => {
    const deletedDv = await db.one("DELETE FROM dvs WHERE id = $1 RETURNING *", id);
    return deletedDv;
};

const updateDv = async (id, dv) => {
    const updatedDv = await db.one(
        "UPDATE dvs SET deck_id=$1, hp=$2, atk=$3, def=$4, special_atk=$5, special_def=$6, speed=$7 \
        WHERE id=$8 RETURNING *",
        [dv.deckId, dv.hp, dv.atk, dv.def, dv.special_atk, dv.special_def, dv.speed, id]
    );
    return updatedDv;
};



module.exports = { getAllDvs, getDv, getPokemonDvs, createDv, deleteDv, updateDv };