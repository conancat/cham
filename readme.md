# Cham
Quick boilerplate for setting up a basic Coffeescript driven app, with Stylus and Jade for the frontend. 

*Note: "Cham" is also a Malaysian/Singaporean drink that mixes coffee, hot chocolate, tea, sugar, milk and a bunch of other stuff. It's awesome. :3*

## How to use
* Clone this repo
* Copy all files to your new project
* Check out the docs for each file at the `/docs` folder
* Start hacking!

## The Stack
* [Coffeescript](https://github.com/jashkenas/coffee-script) by @jashkenas
* [Express](https://github.com/visionmedia/express) by @visionmedia
* [Jade](https://github.com/visionmedia/jade) by @visionmedia
* [Stylus](https://github.com/learnboost/stylus) by @learnboost
* [Vows](https://github.com/cloudhead/vows) by @cloudhead

## File Structure
* `app.js`: Main app file, run `node app.js` to start app
* `public/`: Public folder, all front-end files go here
  * `css`
  * `images`
  * `js`
* `lib/`: All backend files go here
* `test/`: Where all tests are. Currently uses [Vows](http://vowsjs.org/) as example
* `views/`: Where all Jade templates are
* `src/`: Source files, where all Coffeescript and Stylus file resides. The file structure within `src/` folder mirrors the root folder, saves time trying to hunt for files
* `docs/`: [Docco](http://jashkenas.github.com/docco/) generated documentation files

## Compiling Files
There are a couple of helper functions defined within the `Cakefile`, which are: 

    cake watch                # Watches all Coffeescript(JS) and Stylus(CSS) files
    cake watchJS              # Watches all coffeescript files for changes
    cake watchCSS             # Watches all CSS files for changes
    cake compileJS            # Compiles all Coffeescript files into JS
    cake test                 # Runs all tests
    cake docs                 # Create documentation using Docco

To run `Cakefile` remember to install `coffee-script` as a global module, 

    npm install coffee-script -g
    
To compile the CSS you need to install `stylus` as a global module too in order to run the executable:
  
    npm install stylus -g
    
Then, at the root folder, just do 

    cake watch
    
And magic happens! :)

## The idea behind
I love Coffeescript. No doubt to that. So everytime I start a new project I find myself doing all the same steps over and over, creating folders, copying files, installing modules, setting up Cakefile tasks and all those trivial tasks. 

So I thought, why not create a template that I can use over? 

And then I thought, why not share it with everyone? Why not explain the rationale behind these structures as so to benefit others as well?

**Cham** is not meant to be a definitive guide to the universe of Express or Node.JS. It is a combination of ideas, regarding my personal approach of developing with Express, Coffeescript,  Jade and Stylus. 

## Cham is for...
* CoffeeScript, Jade and Stylus enthusiasts
* Developers that wanted a quick base to start working with
* Node.js beginners that want to learn more about Node.js with a more approachable example

## Last words
Fellow developers, please do share with me what are your thoughts, I would love to hear from you and see how we can do better!