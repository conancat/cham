# Get app to set routes to app
app = require '../app'

# Get functions for function type tests
{syncFn, asyncFn} = require './module'

app.get "/", (req, res) ->
  res.render "index"


app.get "/fn-test/:type?", (req, res) ->
  locals = {}
  
  try
    if req.params.type?
      if req.params.type is 'async'
        asyncFn (err, result) ->
          if err? then throw err
          else locals.fnType = result
          res.render 'functionTest', locals

      else if req.params.type is 'sync'
        locals.fnType = syncFn()
        res.render 'functionTest', locals
    
      else
        locals.error = "There is no function called #{req.params.type}."
        res.render 'error', locals
    
    else
      locals.chooseTest = true
      res.render 'functionTest', locals
  
  catch e
    locals.error = e
    res.render 'error', locals