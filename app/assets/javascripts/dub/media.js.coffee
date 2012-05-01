class Media extends $DUB
  constructor: (@options) ->
    $(document).ready =>
      @initIndex()
  
  initIndex: () =>
    $('.thumbs a').bind "click", (e) ->
      e.preventDefault()
      $('#video_player').attr('src', $(this).attr('rel'))
      $('.video-title').text($(this).attr('title'))

$DUB.Application = jQuery.extend({}, $DUB.Application, {Media})