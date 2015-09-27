express = require 'express'
compression = require 'compression'
logger = require 'morgan'
pjax = require 'express-pjax'

util = require './util'
config = require './config'
StylusMiddleware = require './middleware/stylus'
controllers = require './controllers'

oneDay = 86400000

class App
  express: null

  constructor: ->
    @express = express()

  setup: ->
    @express.locals.pretty = on
    @express.set 'views', "#{__dirname}/views"
    @express.set 'view engine', 'jade'
    @express.use pjax()
    @express.use new StylusMiddleware
    @express.use compression()
    @express.use express.static "#{__dirname}/../public", maxAge: oneDay
    @express.use logger(if @express.settings.env is 'development' then 'dev' else 'short')
    @express.use controllers

  server: ->
    @express.listen config.port, config.ipaddress, @serverLog

  serverLog: ->
    => console.log "
      #{ util.dateNow() }: Node server started on #{ config.ipaddress }:#{ config.port }...
    "

module.exports = App
