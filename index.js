#!/bin/env node

// require coffee-script to parse source in .coffee
require('coffee-script/register');

// initialize application
var App = require('./app/index');
var app = new App();
app.setup();
app.server();
