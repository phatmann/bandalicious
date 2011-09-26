$ ->
  $('#available-songs, #selected-songs').sortable(
    connectWith: '.draggable'
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

  $('#songs').sortable(
    scroll: true,
    axis: 'y',
    stop: ->
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

hideEmptyMessage = ->
  $('li.empty', this).hide()
  $(this).removeClass('empty')
 
showEmptyMessageIfEmpty = ->
  if $('li:not(.empty)', this).length == 0
    $('li.empty', this).show()
    $(this).addClass('empty')
    