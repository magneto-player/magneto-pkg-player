
[Player] = []

module.exports =
  activate: ->
    Player = Player or require './player'

    # Init video.js
    niceplay.stylesheets.require('video.js/dist/video-js/video-js', module.paths)

    new Player()

  desactivate: ->
