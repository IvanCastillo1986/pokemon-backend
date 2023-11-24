const db = require("../db/dbConfig");


const getAllBags = async () => {
    const allBags = await db.any("SELECT * FROM bags");
    return allBags;
};

const getBagItems = async (id) => {
    const oneBagItem = await db.one("SELECT * FROM bags WHERE id = $1", id);
    return oneBagItem;
};

const getBagByUserId = async (user_id) => {
    const userBag = await db.any("SELECT item_id FROM bags WHERE user_id = $1", user_id);
    return userBag;
};

// item: item_name, effect, hp_restored, pp_restored, item_desc
// bag: user_id, item_id, quantity
const getItemsInBag = async (user_id) => {
    const itemAndBag = await db.any(
        "SELECT * FROM items FULL OUTER JOIN bags ON bags.item_id = items.id \
        WHERE bags.user_id = $1",
        [user_id]
    );
    return itemAndBag;
};


// ToDo:
// gets used in usersController when creating a new user. 
// creates a new bag item in Bags table when user signs up.
const createBagItem = async (bag) => {
    const newBag = await db.one(
        "INSERT INTO bags (user_id, item_id) VALUES ($1, $2) RETURNING *",
        [bag.user_id, bag.item_id]
    );
    return newBag;
};

const deleteBag = async (user_id) => {
    const deletedBag = await db.any("DELETE FROM bags WHERE user_id = $1 RETURNING *", user_id);
    return deletedBag;
};

const updateBag = async (bagsId, bag) => {
    const updatedBag = await db.one(
        "UPDATE bags SET user_id=$1, item_id=$2 WHERE id=$3 RETURNING *",
        [bag.user_id, bag.item_id, bagsId]
    );
    return updatedBag;
}



module.exports = { getAllBags, getBagItems, getBagByUserId, getItemsInBag, createBagItem, deleteBag, updateBag };