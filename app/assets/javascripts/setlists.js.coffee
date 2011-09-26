$ ->
  $('.song-list .draggable').sortable(
    connectWith: '.song-list .draggable'
    scroll: true
    tolerance: 'pointer'
    items: 'li:not(.empty)'
    appendTo: 'body'
    create: showEmptyMessageIfEmpty
    over: -> $('li.empty', this).hide()
    out: -> if $(this).hasClass('empty') then $('li.empty', this).show()
    receive: hideEmptyMessage
    remove: showEmptyMessageIfEmpty
    distance: 3
  ).disableSelection;

  $('.song-list .sortable').sortable(
    scroll: true,
    axis: 'y',
    stop: ->
      setlistID = $(this).data('setlist_id')
      
      $.ajax
        url: '/setlists/sort'
        type: 'post',
        data: "setlist_id=#{setlistID}&" + $(this).sortable('serialize'),
        dataType: 'script'
  ).disableSelection;

  $('#selected-songs .close').live('click', ->
    $(this).parent().fadeOut('fast', ->
      $(this).appendTo($('#available-songs ul'))
      $(this).fadeIn('fast')
      showEmptyMessageIfEmpty.call($('#selected-songs ul'))
      hideEmptyMessage.call($('#available-songs ul'))
      $('#available-songs ul').sortable('refresh')
    )
  )

hideEmptyMessage = ->
  $('li.empty', this).hide()
  $(this).removeClass('empty')
 
showEmptyMessageIfEmpty = ->
  if $('li:not(.empty)', this).length == 0
    $('li.empty', this).show()
    $(this).addClass('empty')
    