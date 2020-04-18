const Sequelize = require("sequelize");
const connection = require('../dbConn');

const User = connection.define('user', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement : true
    },
    username: {
        type: Sequelize.STRING
    },
    password: {
        type: Sequelize.STRING
    },
    roleId: {
        type: Sequelize.INTEGER
    },
}, {
    freezeTableName: true,
    tableName: 'user',
    timestamps : false
});

module.exports = User;