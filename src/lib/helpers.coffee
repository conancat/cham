# ## Define helper functions

# `extend(main, sub)`
# Description: Extends properties of sub object to main object
# Yes, it works exactly the same with [Underscore](http://documentcloud.github.com/underscore/) `_.extend`.
# But we're here for learning how things work, right? :) 

extend = (main, sub) ->
  for prop of sub
    main[prop] = sub[prop] if sub[prop]?
  main
  
# ## Export module
module.exports = 
  extend: extend