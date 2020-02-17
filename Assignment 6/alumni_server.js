// CIT 381
// Assignment 05
// Lillie Rose

let mysql = require('mysql2');
let dbInfo = require('./dbInfo.js');
let express = require('express');
let bodyParser = require("body-parser");

let app = express();

// Add static route for non-Node.js pages
app.use(express.static('public'));

// Configure body parser for handling post operations
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Get members
app.get('/alumni/:MEMBER_ID?', function (req, res) {
   console.log("Route /alumni GET", req.params);
   let data = [];
   let sql = "SELECT * FROM MEMBER_LIST";
   if (req.params.MEMBER_ID != undefined) {
      sql += " WHERE MEMBER_ID = ?";
      data = [req.params.MEMBER_ID];
      // Object technique:
      // sql += " WHERE ?";
      // data = req.params;
      console.log(data);
   } else {
      sql += " ORDER BY FIRST_NAME";
   }
   console.log("SQL", sql);
   connection.query(sql, data,
      function (errQuery, rows) {
         if (errQuery) {
            console.log(errQuery);
            res.json({rows: [], err: errQuery});
         } else if (rows) {
            console.log("Rows returned", rows.length);
            res.json({rows: rows, err: ""});
         } else {
            console.log("No member rows...\n");
            res.json({rows: [], err: ""});
         }
      }
   );
});

// Add member
app.post('/alumni', function (req, res) {
   console.log("Route /alumni POST");
   let data = {FIRST_NAME: req.body.first, EMAIL_ADDRESS: req.body.email};
   connection.query("INSERT INTO MEMBER_LIST SET ?",
      data,
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            res.json({status: "Error", err: errQuery});
         } else {
            console.log("Insert ID: ", result.insertId);
            res.json({status: result.insertId, err: ""});
         }
      }
   );
});

// Delete member
app.delete('/alumni/:MEMBER_ID?', function (req, res) {
   console.log("Route /alumni DELETE");
   let sql = "DELETE FROM MEMBER_LIST WHERE MEMBER_ID = ?";
   // Object technique:
   // let sql = "DELETE FROM MEMBER_LIST WHERE ?";
   if (req.params.MEMBER_ID != undefined) {
      let data = [req.params.MEMBER_ID];
      // Object technique:
      // let data = {MEMBER_ID: req.params.MEMBER_ID};
      connection.query(sql,
         data,
         function (errQuery, result) {
            if (errQuery) {
               console.log(errQuery);
               res.json({status: "Error", err: errQuery});
            } else {
               console.log("Deleted");
               res.json({status: "Deleted", err: ""});
            }
         }
      );
   } else {
      let s = "Invalid or missing MEMBER_ID";
      console.log(s);
      res.json({status: "Error", err: s});
   }
});

// UPDATE MEMBER_LIST
app.put('/alumni', function (req, res) {
   console.log("Route /alumni PUT");
   let data = [{FIRST_NAME: req.body.first, EMAIL_ADDRESS: req.body.email}, req.body.id];
   connection.query("UPDATE MEMBER_LIST SET ? WHERE MEMBER_ID=?",
      data,
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            res.json({status: "Error", err: errQuery});
         } else {
            console.log("Updated ID: ", result.insertId);
            res.json({status: result.insertId, err: ""});
         }
      }
   );
});

// Assignment 06, insert a get route for a view
app.get('/alumni/:vw_SuccessStoriesList?', function (req, res) {
   console.log("Route /alumni GET", req.params);
   let data = [];
   let sql = "SELECT * vw_SuccessStoriesList";
   if (req.params.MEMBER_ID != undefined) {
      sql += " WHERE MEMBER_ID = ?";
      data = [req.params.MEMBER_ID];
      // Object technique:
      // sql += " WHERE ?";
      // data = req.params;
      console.log(data);
   } else {
      sql += " ORDER BY EMAIL_ADDRESS";
   }
   console.log("SQL", sql);
   connection.query(sql, data,
      function (errQuery, rows) {
         if (errQuery) {
            console.log(errQuery);
            res.json({rows: [], err: errQuery});
         } else if (rows) {
            console.log("Rows returned", rows.length);
            res.json({rows: rows, err: ""});
         } else {
            console.log("No member rows...\n");
            res.json({rows: [], err: ""});
         }
      }
   );
});
// Assignment 06, store procedure delete row
app.get('/alumni/:sp_deleteMembers?', function (req, res) {
   console.log("Route /alumni DELETE");
   let sql = "CALL sp_deleteMembers";
   // Object technique:
   // let sql = "DELETE FROM MEMBER_LIST WHERE ?";
   if (req.params.MEMBER_ID != undefined) {
      let data = [req.params.MEMBER_ID];
      // Object technique:
      // let data = {MEMBER_ID: req.params.MEMBER_ID};
      connection.query(sql,
         data,
         function (errQuery, result) {
            if (errQuery) {
               console.log(errQuery);
               res.json({status: "Error", err: errQuery});
            } else {
               console.log("Deleted");
               res.json({status: "Deleted", err: ""});
            }
         }
      );
   } else {
      let s = "Invalid or missing MEMBER_ID";
      console.log(s);
      res.json({status: "Error", err: s});
   }
});

// Use NodeJS as our web server, needed to prevent cross origin error
// typically seen on Chrome
app.get('/alumni.css', function(req, res) {
   res.sendFile(__dirname + '/alumni.css');
});

app.get('/alumni.html', function(req, res) {
   res.sendFile(__dirname + '/alumni.html');
});

app.get('/alumni.js', function(req, res) {
   res.sendFile(__dirname + '/alumni.js');
});

// Handle missing pages requested using GET HTTP verb
app.get('*', function(req, res) {
   res.status(404).send('Sorry that page does not exist');
});

// Create database connection
console.log('Creating connection...\n');
let connection = mysql.createConnection({
   host: dbInfo.dbHost,
   port: dbInfo.dbPort,
   user: dbInfo.dbUser,
   password: dbInfo.dbPassword,
   database: dbInfo.dbDatabase
});
// Connect to database
connection.connect(function(err) {
   console.log('Connecting to database...\n');

   // Handle any errors
   if (err) {
      console.log(err);
      console.log('Exiting application...\n');
   } else {
      console.log('Connected to database...\n');
      // Listen for connections
      // Note: Will terminate with an error if database connection
      // is closed
      const ip = 'localhost';
      const port = 8080;
      app.listen(port, ip, function () {
         try {
            console.log('Alumni server app listening on port ' + port);
         } catch (err) {
            console.log(err);
         }
      });
   }
});
