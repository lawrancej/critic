# logging hook
# do more later
module.exports = (msgs...)->
  for msg in msgs
    console.log typeof msg+" says "+msg