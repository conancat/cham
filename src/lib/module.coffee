# ## Private Function
# You can define as many private functions as you wish, as long as it is not exported using 
# module.exports, the function will not be exposed to other modules.
privateFn = (fnType) ->
  switch fnType
    when 'async' then return 'Asynchronous Function'
    when 'sync' then return 'Synchronous Function'

# ## Synchronous Function
# A synchronous function can return a value directly. This is probably the most direct form of
# functions that we are used to, right?
syncFn = ->
  return privateFn('sync')

# ## Asynchronous function
# In Node, asynchronous functions are pretty much the norm and the bread and butter of every 
# app. As long as the function requires any operation that is asynchronous, a `callback(err, result)`
# should be used to return the final result back to the caller function. See `routes.coffee`
# for example on how to call asynchronous functions.

asyncFn = (callback) ->
  setTimeout((->callback(null, privateFn('async'))), 300)
  return

# ## Export module
module.exports = 
  syncFn: syncFn
  asyncFn: asyncFn
