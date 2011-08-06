# Get app as dependency
app = require '../app'

app.get "/", (req, res) ->
  res.render "index"
    title: 'Express'