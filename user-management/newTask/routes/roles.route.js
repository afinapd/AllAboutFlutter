const express = require('express');
const router = express.Router();
const RolesService = require('../services/roles.service')
const tokenValidation = require('../middlewares/token-validation');
const { getAllRoles, } = require('../controllers/role.controller')

rolesService = new RolesService();

router.use(tokenValidation);
router.get('/', (req, res, next) => getAllRoles(req, res, rolesService))

module.exports = router