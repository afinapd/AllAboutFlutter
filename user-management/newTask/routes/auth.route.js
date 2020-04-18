const express = require('express');
const router = express.Router();
const AuthService = require('../services/auth.service');
const {userAuthentication} = require("../controllers/user.controller");
const user = require('../models/user.model')

const authService = new AuthService(user);

router.post('/', (req, res, next) => userAuthentication(req, res, authService));

module.exports = router;