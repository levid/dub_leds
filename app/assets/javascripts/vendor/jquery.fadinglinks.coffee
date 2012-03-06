$(document).ready ->
  $("a.link").css "backgroundPosition", "-81px " + ($(this).outerHeight() - 2) + "px"
  $("a.link").bind "mouseenter", (e) ->
    a = $(this)
    a.animate
      backgroundPosition: a.outerWidth() + "px" + (a.outerHeight() - 2) + "px"
    , 600

  $("a.link").bind "mouseleave", (e) ->
    a = $(this)
    a.animate
      backgroundPosition: "-81px " + (a.outerHeight() - 2) + "px"
    , 600