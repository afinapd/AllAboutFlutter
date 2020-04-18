const MasterModule = require('./master.module.model')
const User = require('./user.model')
const Module = require('./module.model')
const Role = require('./role.model')

const dbAssociation = function dbAssociation() {
    Role.hasMany(User);
    User.belongsTo(Role);

    Role.belongsToMany(Module, {through: MasterModule});
    Module.belongsToMany(Role, {through: MasterModule});
};

module.exports = dbAssociation;
