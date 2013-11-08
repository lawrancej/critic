# wraps how we output a github api error
#
module.exports = (status) ->
  return "Github API responded with "+status
