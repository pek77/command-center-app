/**
 * Created by demo on 2018/6/25.
 */

const query = require("../mysql.js");
const SqlString = require('sqlstring');
var app_az = process.env.app_az || "AZ 1";
var instanceId = process.env.instanceId || "ID";


exports.findListByRoleId = function (req, res) {
    let obj = {"instanceId":instanceId,"AZ":app_az};
    if (req.body.id) {
        let id = req.body.id;
        let sql = "SELECT * from content_view where roleId=" + SqlString.escape(id);
        query(sql, function (err, vals) {
            if (err == null) {
                // console.log(vals);
                res.send({data:vals,"APP-Instance":obj})
            } else {
                console.log(err);
                res.send({data:"502","APP-Instance":obj})
            }
        })
    } else {
        res.send({data:"403","APP-Instance":obj})
    }
};

exports.root = function (req, res) {
    res.render("index", {"data":{"instanceId":instanceId,"AZ":app_az}});
};
