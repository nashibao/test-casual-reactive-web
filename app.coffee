express = require("express")
path = require("path")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
session = require('express-session')
flash = require('connect-flash')
routes = require("./apps/index")
debug = require("debug")("plaid")
app = express()

mongoose = require("mongoose")
mongoose.connect("mongodb://@localhost:27017/reactive_web_test")

# view engine setup
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser('jinerqlnoi')
app.use session({cookie: { maxAge: 60000 }})
app.use flash()
app.use (req, res, next)->
  app.locals.pretty = true
  res.locals.message = req.flash()
  next()
app.use "/", routes
app.use express.static(path.join(__dirname, "public"))

#/ catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error("Not Found")
  err.status = 404
  next err
  return

#/ error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: err

    return

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render "error",
    message: err.message
    error: {}

  return

app.set "port", process.env.PORT or 3000
server = app.listen app.get("port"), ->
  debug "Express server listening on port " + server.address().port
  return

io = require('socket.io').listen(server, { log: false })
GLOBAL.io = io

require('./apps/api')
