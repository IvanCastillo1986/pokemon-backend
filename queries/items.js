const db = require("../db/dbConfig");


const getAllItems = async () => {
    const allItems = await db.any("SELECT * FROM items");
    return allItems;
};

const getItem = async (id) => {
    const item = await db.one("SELECT * FROM items WHERE id = $1", id);
    return item;
};

const createItem = async (item) => {
    const newItem = await db.one(
        "INSERT INTO items (item_name, effect, hp_restored, pp_restored, item_desc) \
        VALUES ($1, $2, $3, $4, $5) RETURNING *", 
        [item.item_name, item.effect, item.hp_restored, item.pp_restored, item.item_desc]
    );
    return newItem;
};

const deleteItem = async (id) => {
    const deletedItem = await db.one("DELETE FROM items WHERE id = $1 RETURNING *", id);
    return deletedItem;
};

const updateItem = async (id, item) => {
    const updatedItem = await db.one(
        "UPDATE items SET item_name=$1, effect=$2, hp_restored=$3, pp_restored=$4, item_desc=$5 \
        WHERE id=$6 RETURNING *",
        [item.item_name, item.effect, item.hp_restored, item.pp_restored, item.item_desc, id]
    );
    return updatedItem;
};



module.exports = { getAllItems, getItem, createItem, deleteItem, updateItem };