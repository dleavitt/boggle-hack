loadWords = ->
  fs    = __meteor_bootstrap__.require("fs")
  path  = __meteor_bootstrap__.require("path")

  dictf = path.join(path.resolve("."), "/server/words.txt")
  data  = fs.readFileSync(dictf, 'utf8')
  words = {}

  words[word] = true for word in data.toLowerCase().split("\n") when word.length > 2
  words

createBoard = ->
  # TODO: vowels and consonants needs to be separated
  Board.remove({})

  boardLetters = []
  boardLetters.push VOWELS.pluck() for [0...NUM_VOWELS]
  boardLetters.push CONSONANTS.pluck() for [0...NUM_CONSONANTS]

  Board.insert letters: boardLetters.shuffle()

Meteor.startup ->
  words = loadWords()
  createBoard()
  console.log "startup"