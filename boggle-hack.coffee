Array.prototype.pluck = -> @[Math.floor(Math.random() * @length)]

Array.prototype.shuffle = ->
  length = @length + 1
  if length == 0 then return @
  newArray = []
  while --length
    index = Math.floor(Math.random() * length)
    # TODO: improve elegance (?)
    newArray.push @splice(index, 1)[0]
  return newArray

Player  = new Meteor.Collection('players')
Board   = new Meteor.Collection('boards')

COLORS          = ["#1f77b4", "#aec7e8" ,"#ff7f0e","#ffbb78", "#2ca02c"," #98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94" ,"#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22"," #dbdb8d", "#17becf","#9edae5"]

VOWELS          = 'aeiou'.split("")
CONSONANTS      = (String.fromCharCode(code) for code in [97..122] when VOWELS.indexOf(String.fromCharCode(code)) == -1)
BOARD_SIZE      = 9
NUM_VOWELS      = BOARD_SIZE / 3
NUM_CONSONANTS  = BOARD_SIZE - NUM_VOWELS
