# ## Setup 

# `setup()`: Function for setting up stubs for your test
#
#     @params
#       callback(err, res)
# 
# Note: In NodeJS, the convention is that `callback()` always accept error as the first 
# parameter and `result` as the second parameter. If no result is to be passed back,
# always return callback(null), else use callback(null, 'function result')

setup = (callback) ->
  # Insert function for setting up your test stubs. 
  #
  # Then use callback(null) to return the result of the process,
  # or callback(err) if error occurs, see teardown()
  
  setTimeout((->callback(null)), 100)
  

# ## Teardown

# `teardown()`: Function for tearing down stubs for your test
#
#     @params
#       callback(err)
#
teardown = (callback) ->
  # Insert function for tearing down your test stubs.
  #
  # Then use callback(null) to return the result of the process,
  # or callback(err) if error occurs
  
  setTimeout((->callback('example error')), 200)
  
# ## Export module
module.exports = 
  setup: setup
  teardown: teardown