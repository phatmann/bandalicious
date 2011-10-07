$ ->
  $('.song-list .connected').sortable(
    connectWith: '.song-list .connected'
    scroll: true
    tolerance: 'pointer'
    items: 'li:not(.no-sort)'
    handle: '.handle'
    create: updateSongCount
    over: -> $('li.empty', this).hide()
    out: -> if $(this).hasClass('empty') then $('li.empty', this).show()
    receive: updateSongCount
    remove: updateSongCount
  ).disableSelection;

  $('#available-songs .break').draggable(
    connectToSortable: $('#selected-songs-list')
    helper: 'clone'
    revert: 'invalid'
    handle: '.handle'
  ).disableSelection;

  $('#selected-songs .close').live('click', ->
    $(this).parent().fadeOut('fast', ->
      if $(this).hasClass('break')
        $(this).remove()
      else
        $(this).appendTo($('#available-songs-list'))
        $(this).fadeIn('fast')
        updateSongCount.call($('#available-songs-list'))
        $('#available-songs-list').sortable('refresh')
      
      updateSongCount.call($('#selected-songs-list'))
    )
    return false
  )

  $('#available-songs .add').live('click', ->
    elem = $(this).parent();
    elem = elem.clone() if elem.hasClass('break')
    
    elem.fadeOut('fast', ->
      elem.appendTo($('#selected-songs-list'))
      elem.fadeIn('fast')
      updateSongCount.call($('#available-songs-list'))
      $('#selected-songs-list').sortable('refresh') 
      updateSongCount.call($('#selected-songs-list'))
    )
    return false
  )

updateSongCount = ->
  count = $('li:not(.no-sort)', this).length
  countElem = $('.count', $(this).parent())
  
  if count == 0
    $('li.empty', this).show()
    $(this).addClass('empty')
    countElem.fadeOut('fast')
  else
    $('li.empty', this).hide()
    $(this).removeClass('empty')
    countElem.text(count + (if count > 1 then ' songs' else ' song'))
    countElem.fadeIn('fast')
    
    