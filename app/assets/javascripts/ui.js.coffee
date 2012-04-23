class UI extends $DUB
  constructor: (@options) ->
    this

  initGlobalUI: (options) ->
    @initFadingLinks()
    @initFadingButtons()
    @displayMainNav()
    @initInputs()
    @initNotifications()    if $('.notification').length
    @initNewsletterInput()  if $(".email-updates").length
    @initTooltips()         if $("#sharing-links").length
    @initSharingLinks()     if $("#sharing-links").length
    @resizeContentContainer()

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

  initFadingButtons: () ->
    @fadeButton("a.btn")
    @fadeButton("button")
    @fadeButton("a.my_account")
    @fadeButton("a.log_out")

  fadeButton: (buttonEl) ->
    $(buttonEl).animate({'opacity': '0.9'}, 150)
    $(buttonEl).mouseover(->
      $(this).animate({'opacity': '1.0'}, 150)
    ).mouseout ->
      $(this).animate({'opacity': '0.9'}, 150)

  initNotifications: () ->
    # $('.notification')

    hide: () ->
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
      $(this).animate({'opacity': '0.8'}, 150)
      $(".email-updates input[type=submit]").animate({'opacity': '0.8'}, 150)

  initSharingLinks: () ->
    $("#sharing-links a").animate({'opacity': '0.8'}, 150)
    $("#sharing-links a").mouseover(->
      $(this).animate({'opacity': '1.0'}, 150)
    ).mouseout ->
      $(this).animate({'opacity': '0.8'}, 150)

  initInputs: () ->
    $('input, select, textarea').bind "focus", ->
      $(this).css('border', '1px solid #444')

    $('input, select, textarea').bind "blur", ->
      $(this).css('border', '1px solid #222')

    test: () ->
      $("input, select, textarea").bind "focus", ->
        $(this).addClass('active')
        $("input:not(.active), select:not(.active), textarea:not(.active)").animate({'opacity': '0.4'}, 150)
        $(".active").animate({'opacity': '1.0'}, 150)

      $("input, select, textarea").bind "blur", ->
        $(this).removeClass('active')

  resizeContentContainer: () ->
    currentHeight = $('.content-container.interior').height()
    newHeight = ($(document).innerHeight() - ($('header').outerHeight() + $('footer').outerHeight())) - $('.rim-container').outerHeight() - 30
    unless currentHeight > newHeight
      $('.content-container').css('min-height', newHeight)

$DUB.UI = new UI