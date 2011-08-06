(function() {
  var setup, teardown;
  setup = function(callback) {
    return setTimeout((function() {
      return callback(null);
    }), 100);
  };
  teardown = function(callback) {
    return setTimeout((function() {
      return callback('example error');
    }), 200);
  };
  module.exports = {
    setup: setup,
    teardown: teardown
  };
}).call(this);
