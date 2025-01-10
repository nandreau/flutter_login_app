const express = require("express");
const cors = require("cors");
const bcrypt = require("bcryptjs");

const app = express();

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// database
const db = require("./app/models");
const Role = db.role;

// db.sequelize.sync();
// force: true will drop the table if it already exists
db.sequelize.sync({force: true}).then(() => {
  console.log('Drop and Resync Database with { force: true }');
  initial();
});

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to bezkoder application." });
});

// routes
require('./app/routes/auth.routes')(app);
require('./app/routes/user.routes')(app);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

function initial() {
  Role.create({
    id: 1,
    name: "user"
  });
 
  Role.create({
    id: 2,
    name: "moderator"
  });
 
  Role.create({
    id: 3,
    name: "admin"
  });

  // Create initial users
  const User = db.user;

  User.create({
    username: "adminUser",
    email: "admin@example.com",
    password: bcrypt.hashSync("admin123", 8)
  }).then(user => {
    user.setRoles([3]);
  });

  User.create({
    username: "moderatorUser",
    email: "moderator@example.com",
    password: bcrypt.hashSync("mod123", 8)
  }).then(user => {
    user.setRoles([2]);
  });

  User.create({
    username: "regularUser",
    email: "user@example.com",
    password: bcrypt.hashSync("user123", 8)
  }).then(user => {
    user.setRoles([1]);
  });
}