class Home extends window._Dub
  constructor: (@options) ->
    this.initRimSelect()

  initRimSelect: () ->
    $(document).ready ->
      window._Dub.RimSelect.constructor()

      buttonContainerWidth = $('.rim-reflection .buttons ul li').length * $('.rim-reflection .buttons ul li a').width()
      $('.rim-reflection .buttons ul').css('width', buttonContainerWidth)

window._Dub.Application = jQuery.extend({}, window._Dub.Application, {Home})

