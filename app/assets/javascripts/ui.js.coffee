class UI extends $DUB
  constructor: (@options) ->
    this

  initGlobalUI: (options) ->
    this.initFadingLinks()
    this.displayMainNav()
    this.hideNotifications() if $('.notification')

    topNav = new $DUB.UI.Nav
    newsletter = new $DUB.UI.Newsletter

  fadeLink: (element) ->
    original = $(element).css('color')

    $(element).hover (->
      $(this).animate
        color: "#cccccc"
        , 250
     ), ->
       $(this).animate
        color: original
        , 250

  initFadingLinks: () ->
    self = this
    $('a.fade').each ->
      self.fadeLink(this)

  hideNotifications: () ->
    setTimeout ( ->
      $('.notification').fadeOut(3000)
    ), 300

  displayMainNav: () ->
    self = this
    setTimeout ( ->
      if $('nav.main a').hasClass('active')
        $('nav ul').fadeIn ( ->
           self.initGlowEffect()
        )
      else
        $('nav ul').fadeIn()
    ), 300

  initGlowEffect: () ->
    setGlowEffect = () ->
      setTimeout ( ->
        $('nav ul').fadeIn ( ->
          activeLink = $('nav a.active')
          glowLink = $('.glow')
          position = activeLink.offset()

          pos = position.left
          newPos = (pos + (activeLink.width() / 2)) - (glowLink.width() / 2)

          glowLink.fadeIn()
          glowLink.css('margin-left', newPos)

          glowPosition = glowLink.offset()
        )
      ), 100

    setResize = () ->
      $(window).resize ->
      glowLink = $('.glow')
      glowLink.hide()
      setGlowEffect()

    setGlowEffect()
    setResize()

$DUB.UI = new UI