
Template.players.players = -> Player.find({})

Template.board.letters = ->
  console.log "letters"
  console.log Board
  return
  console.log Board.findOne()
  letterArray = []
  for letter, i in Board.findOne().letters
    letterArray[i % 3] or= []
    letterArray[i % 3].push(letter)

  letterArray


# Template.register.player = ->

Template.register.events
  "keyup .player-name": (e) ->
    name = e.currentTarget.value
    if id = Session.get "player_id"
      player = Player.update id, name: name
    else
      id = Player.insert name: name
      Session.set "player_id", id