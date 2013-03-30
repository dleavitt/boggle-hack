
if Meteor.isClient
  Template.hello.greeting = ->
    "Welcome to boggle-hack."

  Template.hello.events "click input": ->

    # template data, if any, is available in 'this'
    console.log "You pressed the button"

if Meteor.isServer
  # ganked from http://terokaisti.blogspot.com/2012/10/writing-terminal-app-with-meteor-js.html
  Meteor.methods system: (line) ->

    # Run the requested command in shell
    exec line, (error, stdout, stderr) ->

      # Collection commands must be executed within a Fiber
      Fiber(->
        Replies.remove {}
        Replies.insert message: (if stdout then stdout else stderr)
      ).run()



  Meteor.startup ->

    exec = __meteor_bootstrap__.require('child_process').exec
    words = {}
    exec "cat /usr/share/dict/words", (stdout, stderr) ->
      words[word] = true for word in stdout.split("\n")
      console.log words




# code to run on server at startup