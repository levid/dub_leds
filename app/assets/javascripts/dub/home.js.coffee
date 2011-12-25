class Home extends window._Dub
  constructor: (@options) ->
    this.initRimSelect(@options)

  initRimSelect: (options) ->
    $(document).ready =>
      window._Dub.RimSelect.constructor(options)

      buttonContainerWidth = $('.rim-reflection .buttons ul li').length * $('.rim-reflection .buttons ul li a').width()
      $('.rim-reflection .buttons ul').css('width', buttonContainerWidth)

window._Dub.Application = jQuery.extend({}, window._Dub.Application, {Home})

