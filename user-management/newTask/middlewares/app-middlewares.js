const express = require('express');
const router = express.Router();
const dbAssociation = require('../models/index');

router.use(express.json());
router.use((req, res, next) => {
    dbAssociation();
    next();
});

module.exports=router;