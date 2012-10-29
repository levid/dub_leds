class Nav extends $DUB.UI
  constructor: (@options) ->
    this.initUserNav()
    # this.initMainNav()
    this

  initUserNav: () ->
    userNav = $('nav .user ul')
    navWidth = userNav.outerWidth() + 20
    userNav.css('width', navWidth)

    $('#link-to-cart').find('a').addClass('fade') if $('#link-to-cart').length

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