
const path = require("path");
const exphbs = require('express-handlebars');
// const express = require('express');
// const app = express();



module.exports = function(app) {
    const test = "";
    app.get("/", function(req, res) {
    // res.sendFile(path.join(__dirname, "../public/login.html"));
        res.render("login", test);
  })
}