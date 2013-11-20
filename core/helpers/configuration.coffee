# configures and provides acccess to
# the configuration object (from uniformer)
#
validate = require './validation'

config = require('uniformer')({
  defaults:{
    debug: false,
    secret: "critic_app_secret_294802483", #change this in production!!
    key: "critic_session",
    title: "Critic",
    id: "github_api_id", #change this in production!!
    port: 3000,
    whitelist: ["js","cs","cpp","md","html","json","c","py","lisp","hs"]
  }
})

# make sure our config has these keys
if (err = validate(config,"port","debug","secret","key","title","id")) != false
  console.log err
  process.exit -1


module.exports = config