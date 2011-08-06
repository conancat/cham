# Module requires
{extend} = require './helpers'

# ## Configurations
# Configurations can be anything that you want to keep centralized, over here we are 
# using some trival values as examples but well, for demonstration purposes. :) 
# This can be helpful as you can define different values based on environment, 
# such as database names, oAuth application details, or even something as simple as the 
# title of the page.

global = 
  dir:
    views: '/views'
    public: '/public'

development = 
  sessionSecret: 'nyancat'

production = 
  sessionSecret: 'nyannyannyan'
  
# ## Export Module 
# Export module configurations based on environment
switch require('../app').settings.env
  when 'development' then module.exports = extend(global, development)
  when 'production' then module.exports = extend(global, production)