# validates if a config contains keys for each prop
# and returns a useful error if not
module.exports = (config,props...)->
  if config == null
    return "HALT: no config specified!!"
  else
    missing = []
    for prop in props
      if not config[prop]?
        missing.push prop
    err = "HALT: missing "
    for miss,i in missing
      if i+1<missing.length
        err += miss+", "
      else
        err += if missing.length>1 then "and " else ""+miss
    if missing.length == 0
      err = false
    return err