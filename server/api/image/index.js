'use strict';

var express = require('express');
var controller = require('./image.controller');
var auth = require('../../auth/auth.service');

var router = express.Router();

router.get('/', controller.index);
router.get('/:id', controller.show);
router.get('/user/:id', controller.showFromUser);
// router.post('/', auth.isAuthenticated(), controller.create);
router.post('/', controller.create);
// router.put('/:id', auth.isAuthenticated(), controller.update);
router.put('/:id', controller.update);
router.patch('/:id', controller.update);
router.delete('/:id', controller.destroy);

module.exports = router;