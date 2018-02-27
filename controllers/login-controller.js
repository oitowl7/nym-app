var express = require("express");
var router = express.Router();
const path = require("path");

//import the model (users.js) to use its database functions
var nym = require("../models/users.js");

//create all our routes and set up logic with those routes where required 
//***************/
//OBG's NOTE: Not sure if the logic in router.get is what we want...was going off the "MVC Example" in week 14 - hopefully this at least gets you started
//***************/
router.get("/login", function(req, res) {
    nym.all(function(data) {
        var hbsObject = {
            users: data
        };
        // console.log(hbsObject);
        console.log("this happened");
        res.render("login", hbsObject);
    });
});

router.get('/api/allusers', function(req, res) {
    nym.all(data => {
        console.log(data);
    })
})

//router.post goes here

//router.put goes here

//Export routes for server.js to use
module.exports = router;