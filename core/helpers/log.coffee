# logging hook
# do more later
module.exports = (msgs...)->

  # if typeof msg == response, send on it instead
  for msg in msgs
    console.log typeof msg+" says "+msg