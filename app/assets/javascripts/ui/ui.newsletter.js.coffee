class Newsletter extends $DUB.UI
  constructor: (@options) ->
    this.initNewsletter()
    this

  initNewsletter: () ->
    emailAddress  = $('email-address')
    emailValue    = emailAddress.value

    $('#newsletter_email input[type="text"]').focus ->
      if (this.value == this.defaultValue)
        this.value = ''
      if (this.value != this.defaultValue)
        this.select()

    $('#newsletter_email input[type="text"]').blur ->
      if ($.trim(this.value) == '')
        this.value = (if this.defaultValue then this.defaultValue else '')

$DUB.UI = $.extend({}, $DUB.UI, {Newsletter})