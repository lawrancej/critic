request = require 'request'
config = require '../helpers/configuration'

needsAuth = (req)->
  if req.session.auth?
    return not req.session.auth['access_token']?
  else
    return true
getToken = (code,cb)->
  formData = {}
  formData["client_id"] = config.id
  formData["client_secret"] = config.secret
  formData["code"] = code  
  request.post {
      method: 'POST',
      uri:'https://github.com/login/oauth/access_token',
      form:formData,
      headers: {
        "Accept": "application/json"
      }
    },(err,res,body)->
        cb(err,JSON.parse(body))  
renderUnauth = (res,flash = "") ->
  res.render('root',{
        flash: flash,
        title: config["title"],
        auth: {
          id: config["id"],
          scope: config["auth_scope"]
        },
        res: {
          scope: './'
        }
      })
module.exports = {
  method:'get',
  path:'/',
  handler:(req,res)->
    if needsAuth req
      if req.query.code?
        getToken req.query.code,(err,at)->
          if at? and not err? and not at.error?
            req.session.auth = at
            res.redirect "." #do i need to do this? i doubt it
          else
            renderUnauth res,"Github Authentication Error. Please try again!"
      else
        renderUnauth res
    else
      res.render('root',{
        title: config["title"],
        res: {
          scope: './'
        }
      })
}