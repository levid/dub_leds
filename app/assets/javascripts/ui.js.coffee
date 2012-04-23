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
    
    $DUB.UI.showProgressOverlay = this.showGlobalProgressOverlay
    $DUB.UI.hideProgressOverlay = this.hideGlobalProgressOverlay
    $DUB.UI.showSpinner         = this.showSpinner

    $ => # basically the same thing as $(document).ready =>
      $('.centered').center()
        
      $('.submit input').bind 'click', (e, clicked) =>
        e.preventDefault()
        title = $(e.target).attr('title') || 'Saving Data...'
        $DUB.UI.showProgressOverlay title, =>
          $(e.target).parents('form').submit()

      $DUB.UI.showSpinner $('#results_loading .spinner'),
        lines: 15,
        length: 0,
        width: 2,
        radius: 30,
        color: '#fff',
        speed: 1.6,
        trail: 45,
        shadow: false,
        hwaccel: false

    this # allows the method to be chained

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
    currentHeight = $('.content-container .content').outerHeight()
    newHeight = ($(document).innerHeight() - $('.content-container .content').outerHeight() - $('header').outerHeight()) + ($('footer').outerHeight() + $('nav').height()) - $('.rim-container').outerHeight()
    unless currentHeight > newHeight
      $('.content-container').css('min-height', newHeight)

  # Shows a global progress overlay on the page
  #
  # Since the overlays are done purely using CSS3, this function can be called whilst the
  # overlay is showing, and the message will simply change without us having to muck
  # about with event re-binding or any of the usual lightbox malarky
  #
  # This function is also aliased to $DUB.UI.showProgressOverlay
  showGlobalProgressOverlay: (message, callback) ->
    callback = callback or ->
    modalEl = $('#modal_global_progress')
    spinner = modalEl.find('.spinner')

    centerOverlay = (modalEl, spinner, message) ->
      $(spinner).html(message).css('top', (($(window).height() - $(spinner).height()) / 2))
      documentSize = $(document.body).height()
      modalEl.css('height', documentSize).addClass('show')

    centerOverlay(modalEl, spinner, message)

    # I added a very short artificial delay before the callback fires to allow the text to appear.
    #
    # For example if the callback contains a window.location directive it may not show the loading text without the delay.
    setTimeout( ->
      callback()
    , 5)

    this # allows the method to be chained

  # Hides the global progress overlay
  #
  # Aliased to $DUB.UI.hideProgressOveraly
  hideGlobalProgressOverlay: () -> 
    $('#modal_global_progress').removeClass('show')
    this

  # Show a loading spinner
  showSpinner: (target, opts) ->
    opts = opts ||
      lines: 12, # The number of lines to draw
      length: 0, # The length of each line
      width: 2, # The line thickness
      radius: 36, # The radius of the inner circle
      color: '#ffffff', # #rgb or #rrggbb
      speed: 1.6, # Rounds per second
      trail: 45, # Afterglow percentage
      shadow: false, # Whether to render a shadow
      hwaccel: false # Whether to use hardware acceleration

    # var target = $
    #     var spinner = new Spinner(opts).spin(target)

    # define the target element to load the spinner into and call the spin method to initialize
    $(target).spin(opts)
    this # allows the method to be chained

$DUB.UI = new UI