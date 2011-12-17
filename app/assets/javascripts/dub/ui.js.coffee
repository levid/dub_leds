module = (name) ->
  window[name] = window[name] or {}

class UI extends window._Dub
  constructor: (@options) ->
    this

  initGlobalUI: (options) ->
    this.initFadingLinks()
    this.initGlowEffect()

    topNav = new Nav
    newsletter = new Newsletter

  fadeLink: (element) ->
     original = $(element).css('color')
     
     $(element).hover (->
       $(this).animate
         color: "#59B7FF"
       , 250
     ), ->
       $(this).animate
         color: original
       , 250

  initFadingLinks: () ->
    this.fadeLink('a')

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
      ), 300

    setResize = () ->
      $(window).resize ->
      glowLink = $('.glow')
      glowLink.hide()
      setGlowEffect()

    setGlowEffect()
    setResize()

module 'Nav'

Nav = class extends UI
  constructor: (@options) ->
    this.initNav()
    this

  initNav: () ->
    $('.topnav li').prepend('<span></span>')

    $('.topnav li').each ->
      linkText = $(this).find('a').html()
      className = $(this).find('a').attr('class')
      $(this).find('span').html(linkText).show()
      $(this).find('span').addClass(className)

    Cufon.refresh()

    $('.topnav li').hover ->
      $(this).find('span').stop().animate(
        { marginTop: '-40' },
        { duration: 250, easing: 'easeOutQuad' }
      )
    , ->
      $(this).find('span').stop().animate(
        { marginTop: "0" },
        { duration: 250, easing: 'easeOutQuad' }
      )

module 'Newsletter'

Newsletter = class extends UI
  constructor: (@options) ->
    this.initNewsletter()
    this

  initNewsletter: () ->
    emailAddress = $('email-address')
    emailValue = emailAddress.value

    $('input[type="text"]').focus ->
      if (this.value == this.defaultValue)
        this.value = ''
      if (this.value != this.defaultValue)
        this.select()

    $('input[type="text"]').blur ->
      if ($.trim(this.value) == '')
        this.value = (if this.defaultValue then this.defaultValue else '')

window._Dub.UI = new UI