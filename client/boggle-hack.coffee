
Template.players.players = -> Player.find({})

Template.board.letters = -> []

# Template.register.player = ->

Template.register.events
  "keyup .player-name": (e) ->
    name = e.currentTarget.value
    if id = Session.get("player_id")
      player = Player.update id, name: name
    else
      id = Player.insert name: name
      Session.set("player_id", id)