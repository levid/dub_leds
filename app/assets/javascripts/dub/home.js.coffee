class Home extends $DUB
  constructor: (@options) ->
    @initRimSelect()

  initRimSelect: () =>
    $(document).ready =>
      new $DUB.UI.RimSelect(@options)

      buttonContainerWidth = $('.rim-reflection .buttons ul li').length * $('.rim-reflection .buttons ul li a').width()
      $('.rim-reflection .buttons ul').css('width', buttonContainerWidth)

$DUB.Application = jQuery.extend({}, $DUB.Application, {Home})

