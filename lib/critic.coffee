# this is server code  

http = require 'http'
send = require 'send'
request = require 'request'

apiMatcher = new RegExp("^/github-api/")
authMatcher = new RegExp("^/github-auth$")

module.exports = (port,root,client_id,redirect_uri) -> 
  app = http.createServer((req,res) ->
    if authMatcher.test(req.url)
      #do oauth workflow
      req.pipe(request("https://github.com/login/oauth/authorize?client_id="+client_id+"&redirect_uri="+redirect_uri+"&scope=user:email,repo")).pipe(res)
    else if apiMatcher.test(req.url)
      #passthrough to github api
      req.pipe(request("https://api.github.com/"+req.url.split('/github-api/')[1])).pipe(res)
    else
      #serve static
      send(req, req.url).root(root).pipe res
  ).listen port
  console.log "critic instance up on "+port+", serving "+root