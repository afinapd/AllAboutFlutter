const Sequelize = require("sequelize");
const connection = require('../dbConn');

const MasterModule = connection.define('masterModule', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement : true
    },
    moduleId: {
        type: Sequelize.INTEGER
    },
    roleId: {
        type: Sequelize.INTEGER
    },
}, {
    freezeTableName: true,
    tableName: 'masterModule',
    timestamps : false
});

module.exports = MasterModule;