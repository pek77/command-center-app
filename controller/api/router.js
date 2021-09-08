var express = require('express');
// var expressWs = require('express-ws');
var router = express.Router();
// expressWs(router);

let list = require('./features/list');


router.post('/findListByRoleId', list.findListByRoleId);


module.exports = router;
