$ ->
  $('.song-list .connected').sortable(
    connectWith: '.song-list .connected'
    scroll: true
    tolerance: 'pointer'
    items: 'li:not(.no-sort)'
    appendTo: 'body'
    create: showEmptyMessageIfEmpty
    over: -> $('li.empty', this).hide()
    out: -> if $(this).hasClass('empty') then $('li.empty', this).show()
    receive: hideEmptyMessage
    remove: showEmptyMessageIfEmpty
    distance: 3
  ).disableSelection;

  $('#available-songs .break').draggable(
    connectToSortable: $('#selected-songs-list')
    helper: 'clone'
    revert: 'invalid'
  ).disableSelection;

  $('#selected-songs .close').live('click', ->
    $(this).parent().fadeOut('fast', ->
      if $(this).hasClass('break')
        $(this).remove()
      else
        $(this).appendTo($('#available-songs-list'))
        $(this).fadeIn('fast')
        hideEmptyMessage.call($('#available-songs-list'))
        $('#available-songs-list').sortable('refresh')
      
      showEmptyMessageIfEmpty.call($('#selected-songs-list'))
    )
  )

  $('#available-songs .add').live('click', ->
    $(this).parent().fadeOut('fast', ->
      if $(this).hasClass('break')
        elem = $(this).clone()
      else
        elem = $(this)

      elem.appendTo($('#selected-songs-list'))
      elem.fadeIn('fast')
      showEmptyMessageIfEmpty.call($('#available-songs-list'))
      $('#selected-songs-list').sortable('refresh')
      
      hideEmptyMessage.call($('#selected-songs-list'))
    )
  )

hideEmptyMessage = ->
  $('li.empty', this).hide()
  $(this).removeClass('empty')
 
showEmptyMessageIfEmpty = ->
  if $('li:not(.no-sort)', this).length == 0
    $('li.empty', this).show()
    $(this).addClass('empty')
    