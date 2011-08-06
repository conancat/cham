{spawn, exec} = require 'child_process'
sys = require 'sys'

printOutput = (process) ->
  process.stdout.on 'data', (data) -> sys.print data
  process.stderr.on 'data', (data) -> sys.print data
  
watchJS = ->
  coffee = exec 'coffee -cw -o ./ src/'
  printOutput(coffee)

watchCSS = ->
  # Use this line instead if you're using Nib
  # stylus = exec 'stylus --watch --include ./public --use ./node_modules/nib/lib/nib.js --out ./public/css ./src/public/css'
  
  stylus = exec 'stylus --watch --include ./public --out ./public/css ./src/public/css'
  printOutput(stylus)
  
task 'watch', 'Watches all Coffeescript(JS) and Stylus(CSS) files', ->
  watchJS()
  watchCSS()

task 'watchJS', 'Watches all coffeescript files for changes', ->
  watchJS()
  
task 'watchCSS', 'Watches all CSS files for changes', ->
  watchCSS()
  
task 'compileJS', 'Compiles all Coffeescript files into JS', ->
 coffee = exec "coffee -c -o ./ src/"
 printOutput(coffee)
  
task 'test', 'Runs all tests', ->
  vows = exec 'vows test/*.test.js'
  printOutput(vows)