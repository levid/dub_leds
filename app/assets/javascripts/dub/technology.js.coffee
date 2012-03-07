class Technology extends $DUB
  constructor: (@options) ->
    $(document).ready =>
      this.startOverlayButtonListeners()
      this.startSmallRimButtonListeners()

  startOverlayButtonListeners: () ->
    $('.technology-content .overlay .titles a').bind "click", (e) =>
      e.preventDefault()
      @title = $(e.target).attr('title')

      initTechOverlay = (data) ->
        self                 = this
        @overlayDiv          = $("#tech-overlay")
        @overlayContainerDiv = $('#tech-overlay .overlay-container')
        @closeButton         = $('.close-button a')
        @overlayContent      = data[0]
        
        @overlayContainerDiv.find('.middle p').text(@overlayContent.description)
        @overlayContainerDiv.find('.title').text(@overlayContent.title)
        @overlayContainerDiv.find('.sub-title h4').text(@overlayContent.sub_title)

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

      $.ajax
        type: "GET"
        url: "/technology/" + @title
        title: @title,
        success: (resp) =>
          initTechOverlay(resp)

  startSmallRimButtonListeners: () ->
    self = this
    @smallRimButton = $('.technology-content .choices a.rim-small')

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

      $('.technology-content .rim .show').each ->
        $(this).removeClass('show').addClass('hide')

      $('.technology-content .rim').find("##{@rimId}").removeClass('hide').addClass('show')

$DUB.Application = jQuery.extend({}, $DUB.Application, {Technology})