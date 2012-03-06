module = (name) ->
  window[name] = window[name] or {}

class Utilities extends $DUB
  constructor: (@options) ->
    this

$DUB.Utilities = new Utilities