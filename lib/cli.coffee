uniformer = require 'uniformer'
swig = require 'swig'
critic = require './critic'
fs = require 'fs'

# load our config, if possible
config = uniformer {file:'config.json',defaults:{url:"localhost",port:"80",callback:"#authorized",root:"public/"}}

# validate key elements of parsed configuration
if not config.port? or not config.callback? or not config.token? or not config.root?
  console.log "oops, invalid configuration! at least specify token and secret please!"
  process.exit -1

# customize/generate pages from the swig templates (swig dir, wit .swig and .json files)
for file in fs.readdirSync 'swig'
  fs.writeFileSync 'public/'+file.split('.swig')[0]+".html",swig.renderFile file,fs.readFileSync(file.split('.swig')[0]+".json")||{}

# spawn an instance on given port
critic config.port,config.root,config.token,"http://"+config.url+"/"+config.callback