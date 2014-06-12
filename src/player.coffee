
PlayerView = require './views/player'

class Player
  constructor: ->
    @playerView = new PlayerView
    magneto.workspace.append @playerView

    magneto.on 'file:new', @load

    magneto.on '!player:play', @play
    magneto.on '!player:pause', @pause
    magneto.on '!player:stop', @stop
    magneto.on '!player:toggle', @toggle

  load: (url) =>
    magneto.emit 'error:hide'
    @playerView.setFile(url)

  play: =>
    @playerView.play()

  pause: =>
    @playerView.pause()

  stop: =>
    @playerView.stop()

  toggle: =>
    @playerView.toggle()

module.exports = Player
