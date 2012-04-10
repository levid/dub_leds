class Home extends $DUB
  constructor: (@options) ->
    @initRimSelect()
    @initTooltips()

  initRimSelect: () =>
    $(document).ready =>
      new $DUB.UI.RimSelect(@options)

      buttonContainerWidth = $('.rim-reflection .buttons ul li').length * $('.rim-reflection .buttons ul li a').width()
      $('.rim-reflection .buttons ul').css('width', buttonContainerWidth)
      
  initTooltips: () =>
    # $(".buttons a").tipTip()
    $(".buttons a").tipTip
      maxWidth: "auto"
      edgeOffset: 5
      defaultPosition: "top"
      fadeIn: 100
      delay: 200
      keepAlive: true

$DUB.Application = jQuery.extend({}, $DUB.Application, {Home})

