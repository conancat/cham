# For more information about Vows, do check out [http://vowsjs.org/](http://vowsjs.org/)

# Module requires
vows = require 'vows'
assert = require 'assert'

# Require helper functions
{setup, teardown} = require './helpers'
  
# ### Batch for setup function
vowsSetup =
  "...Setting up stubs...":
  
    # `return`: In Coffeescript the last line of every function is compiled with `return`.
    # However in Vows if there are any asyncthronous calls (such as this one), there should
    # not be any return value from the `topic` as the result is supposed to be passed from
    # `this.callback`. 
    #
    # **tl;dr**: Always add `return` at the end of your `topic` if you ever use
    # `this.callback`.
  
    topic: ->
      setup(this.callback)
      return

    "IT should return no error": (err, res) ->
      assert.isNull err

# ### Batch for teardown function
vowsTeardown =
  "...Tearing down stubs...":
    topic: ->
      teardown(this.callback)
      return
    "IT should return no error": (err, res) ->
      assert.isNull err

# ## Vows Test Suite

# ### Create a test suite
testSuite = vows.describe 'Test suite'
  
# ### Create a batch

firstBatch = 
  "GIVEN that this is a test suite":
    # Create a topic
    topic: ->
      return 'test is fine'
  
    # Assertion comes after the topic
    "THEN it should return a string": (res) ->
      assert.isString res
    "AND it should say 'test is fine'": (res) ->
      assert.equal 'test is fine', res

# ## Export the test suite
#
# In Vows, batches run synchronously, so you can add setup and teardown as batches before and 
# after your test.

testSuite
  .addBatch(vowsSetup)
  .addBatch(vowsTeardown)
  .addBatch(firstBatch)
  .export(module)