class SpreeCheckout extends $DUB
  constructor: (@options) ->
    # $('#order_use_billing').bind 'click', (e) ->
    #       $('#shipping .inner').toggle()

$DUB.Application = jQuery.extend({}, $DUB.Application, {SpreeCheckout})