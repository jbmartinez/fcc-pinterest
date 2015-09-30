# Greenterest

Greenterest is a pinterest-like image links sharing application build as a project for [Free Code Camp](http://www.freecodecamp.com/). Having built my other projects for the camp using angular.js, I wanted to test a different framework and complete the project withou jQuery (which is a great library, in my opinion).

I'll use it as boilerplate for my future riot.js projects.

## Tech

This demo application is built using this open source projects:

  * [node.js](http://nodejs.org) - evented I/O for the backend
  * [Express](http://expressjs.com) - fast node.js network app framework
  * [Passport](http://passportjs.org) - simple authentication for Node.js
  * [MongoDB](https://www.mongodb.org) - document based database
  * [Mongoose](http://mongoosejs.com) - MongoDB object modeling for Node.js
  * [Riot.js](http://riotjs.com) - React-like user interface micro-library
  * [RiotControl](https://github.com/jimsparkman/RiotControl) - Flux-like event controller / dispatcher for RiotJS
  * [rg-router](http://riotgear.js.org/components/router) - routing for riot.js apps
  * [Skeleton](http://getskeleton.com) - lightweight and responsive css framework
  * [Grunt](http://gruntjs.com) - JavaScript task runner

Since this project is all about trying different things, I used fetch for requesting data from the server. It includes polyfills for [fetch](https://github.com/github/fetch) and [promises](https://github.com/jakearchibald/es6-promise) to use it on IE9+ and other old browsers.

## TODO

  * Refactoring