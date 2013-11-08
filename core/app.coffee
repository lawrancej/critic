githubApi = require 'github'
express = require 'express'

helpers = require('./helpers')
config = require('uniformer')({defaults:{debug:false}})


# make sure our config has these keys
if (err = helpers.validate(config,"access_token","port","debug")) != false
  console.log err
  process.exit -1


github = new githubApi {
  version: "3.0.0",
  debug: config.debug,
  protocol: "https",
  host: "api.github.com",
  timeout: 5000
}
github.authenticate {
  type: "oauth",
  token: config.access_token
}

app = express()

app.get "/",(req,res)->
  res.send "hi dood"

app.listen config.port
console.log "critic up on "+config.port