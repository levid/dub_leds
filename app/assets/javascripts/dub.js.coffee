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
    window.$DUB = this

    $(document).ready ->
      $DUB.UI.initGlobalUI()

      if (window.location.hash == "#_=_")
        window.location.hash = ""

    this

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
      # throw "#{name} not found in Application namespace"

window._Dub = new Dub

window.state_mapper = {"214":[[1061493585,"Alabama"],[403740659,"Alaska"],[948208802,"Arizona"],[471470972,"Arkansas"],[276110813,"California"],[536031023,"Colorado"],[69870734,"Connecticut"],[721598219,"Delaware"],[6764998,"District of Columbia"],[267271847,"Florida"],[876916760,"Georgia"],[199950338,"Hawaii"],[982433740,"Idaho"],[625629523,"Illinois"],[769938586,"Indiana"],[825306985,"Iowa"],[969722173,"Kansas"],[308473843,"Kentucky"],[37199952,"Louisiana"],[1055056709,"Maine"],[480368357,"Maryland"],[385551075,"Massachusetts"],[931624400,"Michigan"],[1032288924,"Minnesota"],[532363768,"Mississippi"],[653576146,"Missouri"],[999156632,"Montana"],[673350891,"Nebraska"],[179539703,"Nevada"],[426832442,"New Hampshire"],[750950030,"New Jersey"],[69729944,"New Mexico"],[889445952,"New York"],[177087202,"North Carolina"],[51943165,"North Dakota"],[485193526,"Ohio"],[248548169,"Oklahoma"],[298914262,"Oregon"],[471711976,"Pennsylvania"],[474001862,"Rhode Island"],[597434151,"South Carolina"],[615306087,"South Dakota"],[726305632,"Tennessee"],[525212995,"Texas"],[17199670,"Utah"],[989115415,"Vermont"],[41111624,"Virginia"],[414569975,"Washington"],[91367981,"West Virginia"],[103680699,"Wisconsin"],[66390489,"Wyoming"]]}