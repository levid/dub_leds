# Our Global Dub Namespace/Class
#
# This class serves as a namespace for other instantiated classes in the app,
# as well as a place to stuff all other global functions and utils.
#
# When this class is instantiated, it creates a shortcut to itself in the global
# namespace at `$S`

class Dub
  # This is where page-specific "application" classes are instantiated into
  # this is done via the `$S.initPage()` method
  Application: {}
  options:     {}

  # Class Constructor
  constructor: (@options) ->
    window.$S = this

    $(document).ready ->
      _Dub.UI.initGlobalUI()
      
      if (window.location.hash == "#_=_")
        window.location.hash = ""
        
      setTimeout ( ->
        $('.notification').fadeOut(3000)
      ), 300
      
    this
    
  updateStoredCookie: (data) ->
    $.ajax
      type: "POST"
      url: "/cookie"
      data: data,
      success: (data) -> 
        alert(data)

  # Init Page Function
  #
  # This function creates a nice conduit between the server-side and the client-side
  # in the sense that it provides an easy way to instantiate so-called "application"
  # JS classes. These are controller-specific classes, and can even take arguments
  # generated server-side.
  initPage: (name, args...) ->
    if @Application[name]?
      self = this
      F = () ->
        return self.Application[name].apply(this, args)
      F.prototype = @Application[name].prototype
      this[name] = new F
    else
      throw "#{name} not found in Application namespace"

window._Dub = new Dub
