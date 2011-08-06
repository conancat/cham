(function() {
  var assert, firstBatch, setup, teardown, testSuite, vows, vowsSetup, vowsTeardown, _ref;
  vows = require('vows');
  assert = require('assert');
  _ref = require('./testHelpers'), setup = _ref.setup, teardown = _ref.teardown;
  vowsSetup = {
    "...Setting up stubs...": {
      topic: function() {
        setup(this.callback);
      },
      "IT should return no error": function(err, res) {
        return assert.isNull(err);
      }
    }
  };
  vowsTeardown = {
    "...Tearing down stubs...": {
      topic: function() {
        teardown(this.callback);
      },
      "IT should return no error": function(err, res) {
        return assert.isNull(err);
      }
    }
  };
  testSuite = vows.describe('Test suite');
  firstBatch = {
    "GIVEN that this is a test suite": {
      topic: function() {
        return 'test is fine';
      },
      "THEN it should return a string": function(res) {
        return assert.isString(res);
      },
      "AND it should say 'test is fine'": function(res) {
        return assert.equal('test is fine', res);
      }
    }
  };
  testSuite.addBatch(vowsSetup).addBatch(vowsTeardown).addBatch(firstBatch)["export"](module);
}).call(this);
