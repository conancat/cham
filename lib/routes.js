(function() {
  var app, asyncFn, syncFn, _ref;
  app = require('../app');
  _ref = require('./module'), syncFn = _ref.syncFn, asyncFn = _ref.asyncFn;
  app.get("/", function(req, res) {
    return res.render("index");
  });
  app.get("/fn-test/:type?", function(req, res) {
    var locals;
    locals = {};
    try {
      if (req.params.type != null) {
        if (req.params.type === 'async') {
          return asyncFn(function(err, result) {
            if (err != null) {
              throw err;
            } else {
              locals.fnType = result;
            }
            return res.render('functionTest', locals);
          });
        } else if (req.params.type === 'sync') {
          locals.fnType = syncFn();
          return res.render('functionTest', locals);
        } else {
          locals.error = "There is no function called " + req.params.type + ".";
          return res.render('error', locals);
        }
      } else {
        locals.chooseTest = true;
        return res.render('functionTest', locals);
      }
    } catch (e) {
      locals.error = e;
      return res.render('error', locals);
    }
  });
}).call(this);
