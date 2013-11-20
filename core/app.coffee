express = require 'express'
swig = require 'swig'

config = require './helpers/configuration'
log = require './helpers/log'

app = express()

app.use(express.static(__dirname + '/public'))
app.use(express.cookieParser())
#to scale this at ALL, we need to express.session to a db
app.use(express.session({secret:config.secret,key:config.key}))
app.engine('swig', swig.renderFile)
app.set('view engine', 'swig')
app.set('views', __dirname + '/views')

#ok, technically this is bad..
#as we can't properly define the order
flow = require("./flow")
for k,route of flow
  if route.method? and route.path? and route.handler?
    app[route.method] route.path,route.handler
  else
    log "InvalidFlow: ",route

app.listen config.port
console.log "critic up on "+config.port