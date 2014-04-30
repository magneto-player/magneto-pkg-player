
[Player] = []

module.exports =
  activate: ->
    Player = Player or require './player'

    new Player()

  desactivate: ->
