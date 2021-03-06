// //for the task list - roommates can add, update, remove task items as well as set when it's due and who needs to complete the task
var orm = require("../config/orm.js");  

var Tasklist = {
	all: function(cb) {
    orm.all("Tasklist", function(res) {
      cb(res);
    });
  },
    conditional: function(condition, cb) {
      orm.condition("Tasklist", condition, function(res) {
        cb(res);
      });
    },
  	create: function(cols, vals, cb) {
    orm.create("Tasklist", cols, vals, function(res) {
      cb(res);
    });
  },
  update: function(objColVals, condition, cb) {
    orm.update("Tasklist", objColVals, condition, function(res) {
    cb(res);
    });
  },
  join: function(cols, tables, condition, cb) {
    orm.join(cols, ["Tasklist", "users", "houseuserrelationship"], condition, function(res) {
      cb(res);
    }); 
  },
  delete: function(cols, condition, cb) {
    orm.delete(cols, "Tasklist", condition, function(res) {
      cb(res);
    });
  }
};

module.exports = Tasklist;

