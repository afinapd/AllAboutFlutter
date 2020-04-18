const Sequelize = require("sequelize");
const connection = require('../dbConn');

const Module = connection.define('module', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement : true
    },
    module: {
        type: Sequelize.STRING
    },
}, {
    freezeTableName: true,
    tableName: 'module',
    timestamps : false
});

module.exports = Module;