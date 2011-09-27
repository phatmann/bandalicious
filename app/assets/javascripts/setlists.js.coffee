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

  $('.song-list .sortable').sortable(
    scroll: true,
    axis: 'y',
    stop: ->
      bandID    = $(this).data('band_id')
      setlistID = $(this).data('setlist_id')
      
      $.ajax
        url: "/bands/#{bandID}/setlists/#{setlistID}/sort"
        type: 'post',
        data: $(this).sortable('serialize'),
        dataType: 'script'
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

hideEmptyMessage = ->
  $('li.empty', this).hide()
  $(this).removeClass('empty')
 
showEmptyMessageIfEmpty = ->
  if $('li:not(.no-sort)', this).length == 0
    $('li.empty', this).show()
    $(this).addClass('empty')
    