
{View} = magneto.Views
videojs = require '../../vendor/videojsplugins'


videoErrorMessage = (e) ->
  switch e.code
    when e.MEDIA_ERR_ABORTED
      "The video playback was aborted."
    when e.MEDIA_ERR_NETWORK
      "A network error caused the video download to fail part-way."
    when e.MEDIA_ERR_DECODE
      "The video playback was aborted due to a corruption problem or because the video used features your browser did not support"
    when e.MEDIA_ERR_SRC_NOT_SUPPORTED
      "The video format is not supported."
    else
      "An unknown error occurred."

class PlayerView extends View
  @content: ->
    @div id: 'player', =>
      @video
        class: 'video-js vjs-magneto-skin'
        controls: true
        preload: 'auto'
        width: '100%'
        height: '100%'

  initialize: ->
    @video = @find('video').get(0)

    @player = videojs(@video,
      plugins:
        customSubtitles: {}
    )
    @player.ready ->
      magneto.emit('player:ready')

    @player.on 'error', (error) ->
      magneto.emit('error:new', videoErrorMessage(error))

    @on 'click', '.vjs-fullscreen-control', () ->
      magneto.emit('!window:toggle-fullscreen')

    @on 'dblclick', 'video', () ->
      magneto.emit('!window:toggle-fullscreen')

  setFile: (url, play = true) ->
    @video.src = url
    @play() if play

  play: ->
    @player.play()
    @player.on 'play', -> magneto.emit('player:play')

  stop: ->
    @player.stop()

  pause: ->
    @player.pause()

  toggle: ->
    if @video.paused
      @play()
    else
      @pause()

module.exports = PlayerView
