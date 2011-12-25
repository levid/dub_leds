class Technology extends window._Dub
  constructor: (@options) ->
    this.initOverlayButtons()
    this.initSmallRimButtons()

  initTechOverlay: (data) ->
    $(document).ready =>
      
      overlayDiv          = $("#tech-overlay")
      overlayContainerDiv = $('#tech-overlay .overlay-container')
      closeButton         = $('.close-button a')
      
      overlayContent = data[0]
      overlayContainerDiv.find('.middle p').text(overlayContent.description)
      overlayContainerDiv.find('.title').text(overlayContent.title)
      overlayContainerDiv.find('.sub-title h4').text(overlayContent.sub_title)
      
      this.openOverlay overlayDiv
        
      closeButton.click =>
        this.closeOverlay overlayDiv
          
      overlayDiv.click (e) =>
        e.preventDefault()
        if $(e.target).attr('id') == overlayDiv.attr('id')
          this.closeOverlay overlayDiv
        
      $(window).bind "resize", =>
        overlayContainerDiv.center transition: 300
        
  closeOverlay: (overlayDiv) ->
    overlayContainerDiv = overlayDiv.find('.overlay-container')
    overlayContainerDiv.fadeOut 300, ->
      overlayDiv.fadeOut 200
    
  openOverlay: (overlayDiv) ->
    overlayContainerDiv = overlayDiv.find('.overlay-container')
    overlayDiv.fadeIn 200, ->
      overlayContainerDiv.center()
      overlayContainerDiv.fadeIn 300
          
  initOverlayButtons: () ->
    $('.technology-content .overlay .titles a').bind "click", (e) =>
      e.preventDefault()
    
      title = $(e.target).attr('title')
      
      $.ajax
        type: "GET"
        url: "/technology/" + title
        title: title,
        success: (resp) => 
          this.initTechOverlay(resp)

  initSmallRimButtons: () ->
    self = this
    smallRimButton = $('.technology-content .choices a.rim-small')
    smallRimButton.bind "click", (e) ->
      e.preventDefault()
      rimId = $(this).attr('rel')
      
      window._Dub.updateStoredCookie
        cookie_name: "active_rim"
        cookie_value: rimId
      
      smallRimButton.each ->
        $(this).css('opacity', '0.4')
      $(this).css('opacity', '1.0')
      
      $('.technology-content .rim .show').each ->
        $(this).removeClass('show').addClass('hide')
        
      $('.technology-content .rim').find('#' + rimId).removeClass('hide').addClass('show')
      
      

window._Dub.Application = jQuery.extend({}, window._Dub.Application, {Technology})

