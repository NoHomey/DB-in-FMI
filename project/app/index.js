const mysql = require('mysql');
const fs = require('fs');
const sql = fs.readFileSync(process.argv[2]).toString('ascii');
const connection = mysql.createConnection({
  host: "localhost",
  user: "test-drive",
  password: "test-drive",
  database: "test-drive",
  multipleStatements: true
});

connection.connect(function (err) {
    if(err) {
        console.log(err.message);
    } else {
        console.log("Connected!");
        connection.query(sql, function(err, result) {
            if(err) {
                console.log(err.message);
            } else {
                console.log("Success!");
                console.log(result);
                connection.end();
            }
        })
    }
});