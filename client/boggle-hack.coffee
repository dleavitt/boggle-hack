Template.hello.greeting = ->
  return "Welcome to meteor_app."

Template.hello.events({
  'click input': (ev)->
    if ev.target.value == 'logger'
      if (typeof console != 'undefined')
        console.log("You pressed the button")
      console.log Meteor.call 'logger'
})
      