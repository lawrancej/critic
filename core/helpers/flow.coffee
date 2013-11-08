# define the routing flows
# ie, how the app feels

helpers = require('reqall')()

module.exports = {
  org: (gh,req,res) ->
    helpers["user-orgs"](gh,(err,r)->
      if err?
        return helpers.log(res,err)
      if r.meta.status != '200 OK'
        return helpers.log(res,new helpers.GithubApiError(r.meta.status))
      repos = []
      for org,i in r
        helpers["org-repos"](gh,(err,r)->
          if err?
            return helpers.log(res,err)
          if r.meta.status != '200 OK'
            return helpers.log(res,new helpers.GithubApiError(r.meta.status))
          repos.push {org:org.login,repos:r} # this is our visual..currently lolz
          if i+1>r.length
            res.send repos # display all the visuals, since we're at the end
        ,org.login)
    )
  ,user: (gh,req,res)->
    res.send "this flow isn't done yet!"
}