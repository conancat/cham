(function() {
  var app;
  app = require('../app');
  app.get("/", function(req, res) {
    return res.render("index", {
      title: 'Express'
    });
  });
}).call(this);
