(function() {
  var asyncFn, privateFn, syncFn;
  privateFn = function(fnType) {
    switch (fnType) {
      case 'async':
        return 'Asynchronous Function';
      case 'sync':
        return 'Synchronous Function';
    }
  };
  syncFn = function() {
    return privateFn('sync');
  };
  asyncFn = function(callback) {
    setTimeout((function() {
      return callback(null, privateFn('async'));
    }), 300);
  };
  module.exports = {
    syncFn: syncFn,
    asyncFn: asyncFn
  };
}).call(this);
