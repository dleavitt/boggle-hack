if Meteor.isServer
  console.log 'connected'
  
  # generate a new random selection of letters.
  
  Meteor.methods(
    submit_word: (word)->
      console.log 'hey'
    logger: ->
      'you have been logged'
  )
  
  logger: ->
    'you have been logged'
  
