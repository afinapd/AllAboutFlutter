const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
const logEvent = require('../events/myEmitter.js');
// const Users = require('../models/user.model');
const bcrypt = require('bcryptjs');

dotenv.config();

class AuthService {
    constructor(user) {
        this.user = user
    }

    async authenticate(user) {
        const { username, password } = user;
        console.log(username)
        let authUser;
        try {
            authUser = await this.user.findOne({
                where: {
                    username: username,
                }
            });
            console.log(authUser)
            // const matchPassword = bcrypt.compareSync(password, authUser.password);
            
            if (authUser.password==password) {
                const expiresIn = 10000;
                const accessToken = jwt.sign({ id: '111' }, process.env.SECRET_KEY, {
                    expiresIn: expiresIn
                });
                console.log(accessToken)
                authUser = {
                    user: {
                        userId: authUser.id,
                        username: authUser.username,
                        // password: authUser.password
                    }, token: accessToken
                };
            } else {
                authUser = null;
            }
        } catch (e) {
            logEvent.emit('APP-ERROR', {
                logTitle: 'GET-PRODUCT-SERVICE-FAILED',
                logMessage: e
            });
            // throw new Error(e);
        }
        return authUser;
    }
}

module.exports = AuthService;