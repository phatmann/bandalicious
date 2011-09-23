$ ->
  $('#available_songs, #selected_songs').sortable(
    connectWith: '.draggable'
    scroll: true
    tolerance: 'pointer'
    items: 'li:not(.empty)'
    create: ->
      if $('li:not(.empty)', this).length == 0
        $('li.empty', this).show()
    
    over: ->
      $('li.empty', this).hide()
    
    receive: ->
      $('li.empty', this).hide()

    remove: ->
      if $('li:not(.empty)', this).length == 0
        $('li.empty', this).show()
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