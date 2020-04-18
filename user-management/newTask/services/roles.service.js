const logEvent = require('../events/myEmitter.js');
const MasterModule = require('../models/master.module.model')
const User = require('../models/user.model')
const Module = require('../models/module.model')
const Role = require('../models/role.model')

class RolesService {
    async getAllRoles() {
        let result
        try {
            result = await User.findAll({
                include: {
                    model: Role,
                    attributes: ['role'],
                    include: {
                        model: Module,
                        attributes: ['module'],
                        through: { attributes: [] },
                    }
                }
        })
        } catch (e) {
            logEvent.emit('APP_ERROR', {
                logTitle: 'GET-MENU',
                logMessage: e
            })
            throw new Error(e)
        } return result
    }

    async getRoleById(id) {
        let result;
        try {
            result = await User.findByPk(id, {
                include: {
                    model: Role,
                    attributes: ['role'],
                    include: {
                        model: Module,
                        attributes: ['module'],
                        through: { attributes: [] },
                    }
                }
        })
        } catch (e) {
            logEvent.emit('APP-ERROR', {
                logTitle: 'GET-CATEGORY-SERVICE-FAILED',
                logMessage: e
            });
            throw new Error(e);
        }
        return result;
    }
}

module.exports = RolesService;