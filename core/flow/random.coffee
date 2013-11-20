git = require '../helpers/git'
config = require '../helpers/configuration'
cacher = require '../helpers/cacher'
cached = cacher.cached
cache = cacher.cache

sortByLength = (a,b)->
  return b.length-a.length

#this whole random section is JUST MISERABLE
#this is not the way to do this, but it does
#work, so yolo...for now. need to revisit in iteration !eek
randomize = (tree) ->
  rand = Math.floor(Math.random()*tree.length)
  rand = Math.floor(Math.random()*tree.length) while tree[rand].path == 'subdir'
  return rand
randomFile = (tree)->
  rand = randomize(tree)
  for entry in config.whitelist.sort sortByLength
    if tree[rand].path.substr(tree[rand].path.length-entry.length,tree[rand].path.length) == entry
      return tree[rand]
  return randomFile(tree) #its possible for this to blow the stack !eek           

#the exposed flow
module.exports = {
  method:"get",
  path:"/random",
  handler: (req,res)->
    if not req.session.auth?
      return res.send 401,"no access_token"
    if not req.session.auth["access_token"]?
      return res.send 401,"no access_token"
    else
      #if we're in critic=user mode, get random code that [config.access_token] has access to
      # if we're in req.session.access_token then auth first
      if not config["access_token"]?
        git.authenticate {
          type: "oauth",
          token: req.session.auth["access_token"]
        }
      #query some code using git.* methods
      git.user.get {},(err,data)->
        if err?
          console.log err
        else
          username = data.login
          if not cached {key:"repo-list-"+username}
            git.repos.getAll {
                "type": "member",
                "per_page": 100
              },(err,data)->
                if err?
                  console.log err
                else
                  cache {key:"repo-list-"+username,value:data}
                  rand = Math.floor(Math.random()*(data.length))
                  repo = data[rand].name
                  if not cached {key:"commit-list-"+username+"-"+repo}
                    git.repos.getCommits {
                        "user": username,
                        "repo": repo,
                        "per_page": 100
                      },(err,data)->
                        if err?
                          console.log err
                        else
                          cache {key:"commit-list-"+username+"-"+repo,value:data}
                          if not cached {key:"tree-list-"+username+"-repo-"+repo+"-master"}
                            git.gitdata.getTree {
                              "user": username,
                              "repo": repo,
                              "sha": data[rand].sha
                              "recursive": true
                            },(err,data)->
                              if err?
                                console.log err
                              else
                                cache {key:"tree-list-"+username+"-repo-"+repo+"-master",value:data}
                                # we should also be able to only show certain filetypes (ok, config.whitelist)
                                file = randomFile data.tree
                                git.gitdata.getBlob {
                                  "user": username,
                                  "repo": repo,
                                  "sha": file.sha
                                },(err,data)->
                                  if err?
                                    console.log err
                                  else
                                    if data.encoding == 'base64'
                                      data.content = new Buffer(data.content, 'base64').toString()
                                    data.path = repo+"/"+file.path
                                    res.send data


}