class Home extends window._Dub
  constructor: (@options) ->
    this.initRimSelect()

  initRimSelect: () ->
    $(document).ready ->
      window._Dub.RimSelect.constructor()

window._Dub.Application = jQuery.extend({}, window._Dub.Application, {Home})

