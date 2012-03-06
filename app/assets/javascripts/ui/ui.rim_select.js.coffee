class RimSelect extends $DUB.UI
  opts: {}

  constructor: (@options) ->
    @options = $.extend({}, @opts, @options)
    @rimId = @options
    this.initRimSelect()
    this.startListeners()

  initRimSelect: () ->
    if @rimId?
      @count          = $('.rim-reflection .buttons a.active').parent().index()
      @rimContainer   = $(".rim-container .rims-large li").each ->
        $(this).css('display', 'none')
    else
      @count          = 0

    @rimContainer     = $(".rim-container .rims-large")
    @rimCount         = $(".rim-container .rims-large li").size()
    @circleButtons    = $('.rim-reflection .buttons a')

    @setCurrentRim(@count)

  setCurrentRim: (@count) ->
    currentButton = @circleButtons.find(':eq(' + @count + ')')

    @jumpTo(@count)

    $('.rim-reflection .buttons a').each ->
      $(this).removeClass('active')
      $(this).css('opacity', '0.6')

    currentButton.addClass('active')
    currentButton.css('opacity', '1.0')

  animateRim: (@el, options) ->
    @method        = if options.method        then options.method       else ''
    @direction     = if options.direction     then options.direction    else 'left'
    @startLeft     = if options.startLeft     then options.startLeft    else "-=1500px"
    @endLeft       = if options.endLeft       then options.endLeft      else "0px"
    @startOpacity  = if options.startOpacity  then options.startOpacity else 0
    @endOpacity    = if options.endOpacity    then options.endOpacity   else 1
    @duration      = if options.duration      then options.duration     else 700
    @easing        = if options.easing        then options.easing       else 'easeInOutExpo'

    increaseCount = () =>
      if @count is @rimCount-1 then @count = 0 else @count++

    decreaseCount = () =>
      if @count is 0 then @count = @rimCount else @count--

    @el.stop().animate
      left:     @startLeft
      opacity:  @startOpacity
    ,
      duration: @duration
      easing:   @easing

      complete: =>
        if(@direction == 'left')
          @el.css "left", '-2000px'
        else if(@direction == 'right')
          @el.css "left", '2000px'

        if(@method == 'slidePrev')
          increaseCount()
        else if(@method == 'slideNext')
          decreaseCount()

        if($('.rim-reflection .buttons a:eq(' + @count + ')').attr('class') != 'active')
          this.activateButton(@count)

        @el.find("li").each ->
          $(this).hide()

        currentEl = @el.find("li:eq(" + @count + ")")
        rimId = currentEl.attr('class')
        currentEl.show()

        if !@rimId or @rimId != rimId
          $DUB.Utilities.Cookie.updateStoredCookie
            cookie_name: "active_rim"
            cookie_value: rimId

        @el.animate
          left: @endLeft
          opacity: 1
        ,
          duration: @duration
          easing: @easing
          complete: =>

  activateButton: (@index) ->
    $('.rim-reflection .buttons a').each ->
      $(this).removeClass('active')
      $(this).css('opacity', '0.6')

    @currentButton = $('.rim-reflection .buttons a:eq(' + @index + ')')

    @currentButton.addClass('active')
    @currentButton.stop().animate(
      { opacity: '1.0' },
      { duration: 250, easing: 'easeOutQuad' }
    )

  deactivateButton: (@index) ->

  startListeners: () ->
    $(".rim-buttons .left a").click (e) =>
      e.preventDefault()
      @slidePrev()

    $(".rim-buttons .right a").click (e) =>
      e.preventDefault()
      @slideNext()

    @circleButtons.fadeTo(100, 0.6, 'easeOutQuad');
    $('.rim-reflection .buttons a.active').fadeTo(100, 1.0, 'easeOutQuad')

    @circleButtons.hover ->
      if($(this).attr('class') != 'active')
        $(this).stop().animate(
          { opacity: '1.0' },
          { duration: 250, easing: 'easeOutQuad' }
        )
    , ->
      if($(this).attr('class') != 'active')
        $(this).stop().animate(
          { opacity: '0.6' },
          { duration: 250, easing: 'easeOutQuad' }
        )

    @circleButtons.bind 'click', (e) =>
      e.preventDefault()
      @index = @circleButtons.index(e.target)
      @count = @index

      if(@count < @rimCount/2)
        @slideToLeft(@count)

      if(@count >= @rimCount/2)
        @slideToRight(@count)

      $('.rim-reflection .buttons a').each ->
        $(this).removeClass('active')
        $(this).css('opacity', '0.6')

      $(e.target).addClass('active')
      $(e.target).css('opacity', '1.0')

  slideNext: () =>
    @count = @rimCount if @count is 0
    @animateRim(@rimContainer,
      method:       'slideNext'
      direction:    'left'
      startLeft:    '+=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  slidePrev: () =>
    @animateRim(@rimContainer,
      method:       'slidePrev'
      direction:    'right'
      startLeft:    '-=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  slideToRight: (@count) =>
    @animateRim(@rimContainer,
      method:       'slideToRight'
      direction:    'left'
      startLeft:    '+=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  slideToLeft: (@count) =>
    @animateRim(@rimContainer,
      method:       'slideToLeft'
      direction:    'right'
      startLeft:    '-=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  jumpTo: (@count) =>
    @animateRim(@rimContainer,
      method:       'slideToLeft'
      direction:    'right'
      startLeft:    '0px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     1
      easing:       'easeInOutExpo'
    )

$DUB.UI = $.extend({}, $DUB.UI, {RimSelect})
