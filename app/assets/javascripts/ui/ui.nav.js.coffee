class Nav extends $DUB.UI
  constructor: (@options) ->
    this.initUserNav()
    this.initMainNav()
    this

  initUserNav: () ->
    userNav = $('nav .user ul')
    navWidth = userNav.outerWidth() + 10
    userNav.css('width', navWidth)

  initMainNav: () ->
    $('.topnav li').prepend('<span></span>')
    $('.topnav li').each ->
      linkText = $(this).find('a').html()
      className = $(this).find('a').attr('class')
      $(this).find('span').html(linkText).show()
      $(this).find('span').addClass(className)

    $('.topnav li').hover ->
      $(this).find('span').stop().animate
        marginTop: '-40'
        duration: 450, easing: 'easeOutQuad'
    , ->
      $(this).find('span').stop().animate
        marginTop: "0"
        duration: 450, easing: 'easeOutQuad'

$DUB.UI = $.extend({}, $DUB.UI, {Nav})