const db = require("../db/dbConfig");


const getAllUsers = async () => {
    const allUsers = await db.any("SELECT * FROM users");
    return allUsers;
};

const getUser = async (uuid) => {
    const oneUser = await db.one("SELECT * FROM users WHERE uuid = $1", uuid);
    return oneUser;
};

const createUser = async (user) => {
    const newUser = await db.one(
        "INSERT INTO users (email, uuid) VALUES ($1, $2) RETURNING *",
        [user.email, user.uuid]
    );
    return newUser;
};

const deleteUser = async (uuid) => {
    const deletedUser = await db.one("DELETE FROM users WHERE uuid = $1 RETURNING *", uuid);
    return deletedUser;
}

const updateUser = async (uuid, user) => {
    const updatedUser = await db.one(
        "UPDATE users SET email=$1, uuid=$5, has_chosen_starter=$2, wins=$3, losses=$4 \
        WHERE uuid=$5 RETURNING *",
        [user.email, user.has_chosen_starter, user.wins, user.losses, uuid]
    );
    return updatedUser;
}


module.exports = { getAllUsers, getUser, createUser, updateUser, deleteUser };