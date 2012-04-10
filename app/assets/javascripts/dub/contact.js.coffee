class Contact extends $DUB
  constructor: (@options) ->
    @initInputs()
    
  initInputs: () ->
    $(".contact-form input, .contact-form select, .contact-form textarea").bind "focus", ->
      $(this).addClass('active')
      $(".contact-form input:not(.active), .contact-form select:not(.active), .contact-form textarea:not(.active)").animate({'opacity': '0.4'}, 150)
      $(".contact-form .active").animate({'opacity': '1.0'}, 150)
      
    $(".contact-form input, .contact-form select, .contact-form textarea").bind "blur", ->
      $(this).removeClass('active')
      

$DUB.Application = jQuery.extend({}, $DUB.Application, {Contact})