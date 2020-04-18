const MasterModule = require('./models/master.module.model')
const User = require('./models/user.model')
const Module = require('./models/module.model')
const Role = require('./models/role.model')
const connection = require('./dbConn');
const dbAssociation = require('./models/index');

async function migration() {
    dbAssociation();
    await connection.sync({force: true});

    const role1 = await Role.create({ role: "Admin" });
    const role2 = await Role.create({ role: "Manager" });

    const module1 = await Module.create({ module: "Home" });
    const module2 = await Module.create({ module: "Report" });
    const module3 = await Module.create({ module: "Profile" });

    await role1.addModule(module1);
    await role1.addModule(module2);
    await role1.addModule(module3);
    
    await role2.addModule(module1);
    await role2.addModule(module3);

    const user1 = await User.create({username:"Afina", password: "abc"});
    const user2 = await User.create({username:"Putri", password:"abc"});
    await user1.setRole(role1);
    await user2.setRole(role2);
}

migration();