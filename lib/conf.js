(function() {
  var development, extend, global, production;
  extend = require('./helpers').extend;
  global = {
    dir: {
      views: '/views',
      public: '/public'
    }
  };
  development = {
    sessionSecret: 'nyancat'
  };
  production = {
    sessionSecret: 'nyannyannyan'
  };
  switch (require('../app').settings.env) {
    case 'development':
      module.exports = extend(global, development);
      break;
    case 'production':
      module.exports = extend(global, production);
  }
}).call(this);
