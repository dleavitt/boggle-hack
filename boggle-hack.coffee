Player = new Meteor.Collection('players')

COLORS = ["#1f77b4", "#aec7e8" ,"#ff7f0e","#ffbb78", "#2ca02c"," #98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94" ,"#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22"," #dbdb8d", "#17becf","#9edae5"]

Player.upsert = (id) ->
  @findOne(id)

if Meteor.isClient

  Template.players.players = -> Player.find({})

  # Template.register.player = ->

  Template.register.events
    "keyup .player-name": (e) ->
      name = e.currentTarget.value
      if id = Session.get("player_id")
        player = Player.update id, name: name
      else
        id = Player.insert name: name
        Session.set("player_id", id)


if Meteor.isServer
  loadWords = ->
    fs    = __meteor_bootstrap__.require("fs")
    path  = __meteor_bootstrap__.require("path")

    dictf = path.join(path.resolve("."), "/server/words.txt")
    data  = fs.readFileSync(dictf, 'utf8')
    words = {}

    words[word] = true for word in data.toLowerCase().split("\n") when word.length > 2
    words

  Meteor.startup ->
    console.log loadWords()




# code to run on server at startup