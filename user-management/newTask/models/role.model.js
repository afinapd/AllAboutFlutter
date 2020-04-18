const Sequelize = require("sequelize");
const connection = require('../dbConn');

const Role = connection.define('role', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement : true
    },
    role: {
        type: Sequelize.STRING
    },
}, {
    freezeTableName: true,
    tableName: 'role',
    timestamps : false
});

module.exports = Role;