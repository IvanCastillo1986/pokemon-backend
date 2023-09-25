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


module.exports = { getAllUsers, getUser, createUser, deleteUser };