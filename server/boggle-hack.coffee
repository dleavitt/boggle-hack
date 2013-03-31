loadWords = ->
  fs    = __meteor_bootstrap__.require("fs")
  path  = __meteor_bootstrap__.require("path")

  dictf = path.join(path.resolve("."), "/server/words.txt")
  data  = fs.readFileSync(dictf, 'utf8')
  words = {}

  words[word] = true for word in data.toLowerCase().split("\n") when word.length > 2
  words


Meteor.startup -> console.log loadWords()