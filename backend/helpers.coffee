class NumberRange
  constructor: (range...) ->
    min = null
    max = null
    for num in range
      if not min? or num<min
        min = num
      if not max? or num>max
        max = num
    if not max? or not min?
      @isValid = false
    @min = min
    @max = max
  isValid: () ->
    return @isValid

module.exports = {
  NumberRange: NumberRange
}