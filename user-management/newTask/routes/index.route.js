const express = require('express');
const router = express.Router();

const authRoutes = require('./auth.route')
const rolesRoutes = require('./roles.route')

router.use('/login',authRoutes)
router.use('/getRoles', rolesRoutes);

module.exports = router