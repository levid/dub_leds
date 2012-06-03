class Generator extends $DUB
  constructor: (@options) ->
    $(document).ready =>
      @smallRimButtonListeners()
      
      setTimeout ( ->
        $('.image').fadeIn()
      ), 700
      
  
  smallRimButtonListeners: () ->
    self = this
    @smallRimButton = $('.generator .choices a.rim-small')

    setOpacityValues = () =>
      @smallRimButton.hover ->
        $(this).animate({'opacity': '0.9'}, 250);
      , ->
        if $(this).hasClass('active')
          @originalOpacity = $(this).css('opacity')
          $(this).animate({'opacity': @originalOpacity}, 250)
        else
          $(this).animate({'opacity': '0.4'}, 250);

    setOpacityValues()

    @smallRimButton.bind "click", (e) ->
      e.preventDefault()
      @rimId = $(this).attr('rel')

      $DUB.Utilities.Cookie.updateStoredCookie
        cookie_name: "active_rim"
        cookie_value: @rimId

      @currentIndex = self.smallRimButton.index(this)

      self.smallRimButton.each ->
        $(this).removeClass('active')
        $(this).css('opacity', '0.4')

      $(this).css('opacity', '1.0')
      $(this).addClass('active')

      $('.generator .rim .show').each ->
        $(this).removeClass('show').addClass('hide').css('opacity', '0.0')

      $('.generator .rim').find("##{@rimId}").removeClass('hide').addClass('show').animate({'opacity': '1.0'}, 450)

$DUB.Application = jQuery.extend({}, $DUB.Application, {Generator})