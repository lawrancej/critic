# from a valid github session 
# get the repos of an org
module.exports = (github,cb,org,page=1,type="all",per_page=30)->
  github.repos.getFromOrg {org:org,page:page,type:type,per_page:per_page},cb