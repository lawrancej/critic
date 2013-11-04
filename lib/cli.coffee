uniformer = require 'uniformer'
critic = require './critic'

# load our config, if possible
config = uniformer {file:'config.json',defaults:{url:"localhost",port:"80",callback:"#authorized",root:"public/"}}

# validate key elements of parsed configuration
if not config.port? or not config.callback? or not config.token? or not config.root?
  console.log "oops, invalid configuration! at least specify token and secret please!"
  process.exit -1

# customize/generate pages from the swig templates


# spawn an instance on given port
critic config.port,config.root,config.token,"http://"+config.url+"/"+config.callback