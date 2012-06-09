$.fn.extend exists: ->
  if $(this).length > 0
    return true
  else
    return false
   
$.fn.spin = (opts) ->
  @each ->
    $this = $(this)
    data = $this.data()
    if data.spinner
      data.spinner.stop()
      delete data.spinner
    if opts isnt false
      data.spinner = new Spinner($.extend(
        color: $this.css("color")
      , opts)).spin(this)
  this

$.fn.extend center: ->
  @each ->
    top = ($(window).height() - $(this).outerHeight()) / 2
    left = ($(window).width() - $(this).width()) / 2

    $(this).css
      position: "fixed"
      margin: 0
      top: (if top > 0 then top else 0) + "px"
      left: (if left > 0 then left else 0) + "px"

# 
# $.fn.center = ->
#   @css "position", "fixed"
#   @css "top", (($(window).height() - @outerHeight()) / 2) + "px"
#   @css "left", (($(window).width() - @outerWidth()) / 2) + "px"
#   this

$.extend $.ajax,
  options:
    initialDelay: 5000
    delay: 5000
    limit: 60000

  startTimer: (data) ->
    fn = ->
      this.send data: data unless @running

    @lastDelay = @options.initialDelay
    @timer = setTimeout(this, @lastDelay)
    @completeCheck = (response) ->
      clearTimeout @timer
      @lastDelay = (if (response) then @options.delay else (@lastDelay + @options.delay).min(@options.limit))
      @timer = setTimeout(this, @lastDelay)

    this.bind "complete", @completeCheck

  stopTimer: ->
    clearTimeout @timer
    this.unbind "complete", @completeCheck


# $.fn.extend clone: ->
#   i = @length
#   clone = new Array(i)
#   clone[i] = this.cloneOf(this[i])  while i--
#   clone
# 
#   cloneOf: (item) ->
#     switch typeOf(item)
#       when "array"
#         item.clone()
#       when "object"
#         Object.clone item
#       else
#         item
