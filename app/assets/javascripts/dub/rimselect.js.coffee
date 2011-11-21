class RimSelect extends window._Dub
  constructor: (@options) ->
    this.initRimSelect()
    this.initButtons()

  initRimSelect: () ->
    @count          = 0
    @rimContainer   = $(".rim-container .rims-large")
    @rimCount       = $(".rim-container .rims-large li").size()
    @circleButtons  = $('.rim-reflection .buttons a')

  slideNext: () ->
    this.counter()
    this.animateRim(@rimContainer,
      method:       'slideNext'
      direction:    'left'
      startLeft:    '+=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  slidePrev: () ->
    console.log(@count)
    this.animateRim(@rimContainer,
      method:       'slidePrev'
      direction:    'right'
      startLeft:    '-=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  slideToRight: (@count) ->
    this.animateRim(@rimContainer,
      method:       'slideToRight'
      direction:    'left'
      startLeft:    '+=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  slideToLeft: (@count) ->
    this.animateRim(@rimContainer,
      method:       'slideToLeft'
      direction:    'right'
      startLeft:    '-=1500px'
      endLeft:      '0px'
      startOpacity: 0
      endOpacity:   1
      duration:     700
      easing:       'easeInOutExpo'
    )

  counter: (direction) ->
    @count = @rimCount if @count is 0

  decreaseCount: () ->
    if @count is 0 then @count = @rimCount else @count--

  increaseCount: () ->
    if @count is @rimCount-1 then @count = 0 else @count++

  animateRim: (@el, options) ->
    @method        = if options.method        then options.method       else ''
    @direction     = if options.direction     then options.direction    else 'left'
    @startLeft     = if options.startLeft     then options.startLeft    else "-=1500px"
    @endLeft       = if options.endLeft       then options.endLeft      else "0px"
    @startOpacity  = if options.startOpacity  then options.startOpacity else 0
    @endOpacity    = if options.endOpacity    then options.endOpacity   else 1
    @duration      = if options.duration      then options.duration     else 700
    @easing        = if options.easing        then options.easing       else 'easeInOutExpo'

    @el.stop().animate
      left:     @startLeft
      opacity:  @startOpacity
    ,
      duration: @duration
      easing: @easing

      complete: =>
        if(@direction == 'left')
          @el.css "left", '-2000px'
        else if(@direction == 'right')
          @el.css "left", '2000px'

        if(@method == 'slidePrev')
          this.increaseCount()
        else if(@method == 'slideNext')
          this.decreaseCount()

        if($('.rim-reflection .buttons a:eq(' + @count + ')').attr('class') != 'active')
          this.activateButton(@count)

        @el.find("li").each ->
          $(this).hide()

        @el.find("li:eq(" + @count + ")").show()
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

  initButtons: () ->
    $(".rim-buttons .left a").click (event) =>
      event.preventDefault()
      this.slidePrev()

    $(".rim-buttons .right a").click (event) =>
      event.preventDefault()
      this.slideNext()

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

    @circleButtons.bind 'click', (event) =>
      event.preventDefault()
      @index = @circleButtons.index(event.target)
      @count = @index

      if(@count < @rimCount/2)
        this.slideToLeft(@count)

      if(@count >= @rimCount/2)
        this.slideToRight(@count)

      $('.rim-reflection .buttons a').each ->
        $(this).removeClass('active')
        $(this).css('opacity', '0.6')

      $(event.target).addClass('active')
      $(event.target).css('opacity', '1.0')

window._Dub.RimSelect = new RimSelect
