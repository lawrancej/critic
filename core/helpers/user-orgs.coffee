# from a valid github session 
# get the orgs of a user
module.exports = (github,cb,page=1,per_page=30)->
  github.user.getOrgs {page:page,per_page:per_page},cb