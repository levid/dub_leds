class Generator extends $DUB
  constructor: (@options) ->
    $(document).ready =>
      @smallRimButtonListeners()
      # @overlayButtonListeners()

      $("input[type=file]").filestyle
        image: "/assets/button-upload-image-small.png"
        imageheight: 51
        imagewidth: 185
        width: 100

      $(".file").css('display', 'none')

      $("input[type=file]").change ->
        $('.generator-form').submit()
        $DUB.UI.showProgressOverlay()

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

      $('.generator .rim').find("##{@rimId}").removeClass('hide').addClass('show').css('opacity', '1.0')


  overlayButtonListeners: () ->
    $('.upload a').bind "click", (e) ->
      e.preventDefault()

      @title = $(e.target).attr('rel')

      initGeneratorOverlay = (data) ->
        self                 = this
        @overlayDiv          = $("#generator-overlay")
        @overlayContainerDiv = $('#generator-overlay .overlay-container')
        @closeButton         = $('.close-button a')

        openOverlay = (el) =>
          @overlayContainerDiv = el.find('.overlay-container')
          el.fadeIn 200, =>
            @overlayContainerDiv.center()
            @overlayContainerDiv.fadeIn 300

        closeOverlay = (el) =>
          @overlayContainerDiv = el.find('.overlay-container')
          @overlayContainerDiv.fadeOut 300, ->
            el.fadeOut 200

        openOverlay(@overlayDiv)

        @closeButton.click (e) =>
          e.preventDefault()
          closeOverlay(@overlayDiv)

        @overlayDiv.click (e) =>
          e.preventDefault()
          if $(e.target).attr('id') == @overlayDiv.attr('id')
            closeOverlay(@overlayDiv)

        $(window).bind "resize", =>
          @overlayContainerDiv.center
            transition: 300

      initGeneratorOverlay()

$DUB.Application = jQuery.extend({}, $DUB.Application, {Generator})