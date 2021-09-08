/**
 * Created by demo on 2018/6/25.
 */

const query = require("../mysql.js");
const SqlString = require('sqlstring');
var app_az = process.env.app_az || "AZ 1";


exports.findListByRoleId = function (req, res) {
    if (req.body.id) {
        let id = req.body.id;
        let sql = "SELECT * from content_view where roleId=" + SqlString.escape(id);
        query(sql, function (err, vals) {
            if (err == null) {
                // console.log(vals);
                res.send({data:vals,"app_az":app_az})
            } else {
                console.log(err);
                res.sendStatus(502)
            }
        })
    } else {
        res.sendStatus(403);
    }
};
