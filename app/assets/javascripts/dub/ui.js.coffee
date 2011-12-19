module = (name) ->
  window[name] = window[name] or {}

class UI extends window._Dub
  constructor: (@options) ->
    this

  initGlobalUI: (options) ->
    this.initFadingLinks()
    this.displayMainNav()

    topNav = new Nav
    newsletter = new Newsletter

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
    this.fadeLink('a.fade')
    
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

module 'Nav'

Nav = class extends UI
  constructor: (@options) ->
    this.initUserNav()
    this.initMainNav()

    this
    
  initUserNav: () ->
    userNav = $('nav.user ul')
    navWidth = userNav.outerWidth()
    userNav.css('width', navWidth)

  initMainNav: () ->
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