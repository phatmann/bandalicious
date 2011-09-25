$ ->
  $('#available-songs, #selected-songs').sortable(
    connectWith: '.draggable'
    scroll: true
    tolerance: 'pointer'
    items: 'li:not(.empty)'
    appendTo: 'body'
    start: startDragging
    stop: stopDragging
    activate: startDragging
    deactivate: stopDragging
    create: showEmptyMessageIfEmpty
    over: hideEmptyMessage
    receive: hideEmptyMessage
    remove: showEmptyMessageIfEmpty
    distance: 3
  ).disableSelection;

  $('#songs').sortable(
    scroll: true,
    axis: 'y',
    start: ->
      $(this).css('list-style-type', 'disc')
    stop: ->
      $(this).css('list-style-type', 'decimal')
      setlistID = $('#songs').data('setlist_id')
      
      $.ajax
        url: '/setlists/sort'
        type: 'post',
        data: "setlist_id=#{setlistID}&" + $('#songs').sortable('serialize'),
        dataType: 'script'
  ).disableSelection;

  $('#selected-songs .close').live('click', ->
    $(this).parent().fadeOut('fast', ->
      $(this).appendTo($('#available-songs'))
      $(this).fadeIn('fast')
      showEmptyMessageIfEmpty.call($('#selected-songs'))
      hideEmptyMessage.call($('#available-songs'))
      $('#available-songs').sortable('refresh')
    )
  )


startDragging = -> 
  if this.id == 'selected-songs'
    $(this).css('list-style-type', 'disc')

stopDragging = ->
  if this.id == 'selected-songs'
    $(this).css('list-style-type', 'decimal')

hideEmptyMessage = ->
  $('li.empty', this).hide()
  $(this).removeClass('empty')
 
showEmptyMessageIfEmpty = ->
  if $('li:not(.empty)', this).length == 0
    $('li.empty', this).show()
    $(this).addClass('empty')
    