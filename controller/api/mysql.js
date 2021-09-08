/**
 * Created by demo on 2018/4/2.
 */
var mysql = require("mysql");
var pool = mysql.createPool({
    host: process.env.MYSQL_HOST || "172.20.5.63",
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PWD || 'root',
    database: process.env.MYSQL_DB || 'command_center',
    port: process.env.MYSQL_PORT || "3306",
    multipleStatements: true,
    dateStrings : true
});
console.log("===============");
console.log(pool);
console.log("****************");
var query = function (sql, callback) {
    pool.getConnection(function (err, conn) {
        if (err) {
            callback(err, null, null);
        } else {
            conn.query(sql, function (qerr, vals, fields) {
                console.log("SQL:" + sql);
                //释放连接
                conn.release();
                //事件驱动回调
                callback(qerr, vals, fields);
            });
        }
    });
};
module.exports = query;
