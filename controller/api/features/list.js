/**
 * Created by demo on 2018/6/25.
 */

const query = require("../mysql.js");
const SqlString = require('sqlstring');
var app_az = process.env.app_az || "AZ 1";
var instantId = process.env.instantId || "instantId";


exports.findListByRoleId = function (req, res) {
    if (req.body.id) {
        let id = req.body.id;
        let sql = "SELECT * from content_view where roleId=" + SqlString.escape(id);
        let obj = {}
        query(sql, function (err, vals) {
            if (err == null) {
                // console.log(vals);
                obj["Web-Instant"] = {"instantId":instantId,"AZ":web_az};
                res.send({data:vals,obj})
            } else {
                console.log(err);
                res.send({data:"502",obj})
            }
        })
    } else {
        res.send({data:"403",obj})
    }
};
