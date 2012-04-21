class UI extends $DUB
  constructor: (@options) ->
    this

  initGlobalUI: (options) ->
    @initFadingLinks()
    @displayMainNav()
    @hideNotifications()    if $('.notification').length
    @initNewsletterInput()  if $(".email-updates").length
    @initTooltips()         if $("#sharing-links").length
    @initSharingLinks()     if $("#sharing-links").length

    topNav      = new $DUB.UI.Nav
    newsletter  = new $DUB.UI.Newsletter

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

  initTooltips: () ->
    $("#sharing-links a").tipTip
      maxWidth: "auto"
      edgeOffset: 5
      defaultPosition: "top"
      fadeIn: 100
      delay: 200
      keepAlive: false
      enter: () =>
      exit: () =>

  initNewsletterInput: () ->
    $(".email-updates input").animate({'opacity': '0.7'}, 150)
    $(".email-updates input").bind "focus", ->
      $(this).animate({'opacity': '1.0'}, 150)
      $(".email-updates input[type=submit]").animate({'opacity': '1.0'}, 150)

    $(".email-updates input").bind "blur", ->
      $(this).animate({'opacity': '0.7'}, 150)
      $(".email-updates input[type=submit]").animate({'opacity': '0.7'}, 150)

  initSharingLinks: () ->
    $("#sharing-links a").animate({'opacity': '0.7'}, 150)
    $("#sharing-links a").mouseover(->
      $(this).animate({'opacity': '1.0'}, 150)
    ).mouseout ->
      $(this).animate({'opacity': '0.7'}, 150)


$DUB.UI = new UI