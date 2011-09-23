$ ->
  $('#available-songs, #selected-songs').sortable(
    connectWith: '.draggable'
    scroll: true
    tolerance: 'pointer'
    items: 'li:not(.empty)'
    appendTo: 'body'

    start: ->
      if $(this).css('list-style-type') == 'decimal'
        $(this).data('list-style-type', 'decimal')
        $(this).css('list-style-type', 'disc')
    
    stop: ->
      if $(this).data('list-style-type')
        $(this).css('list-style-type', $(this).data('list-style-type'))

    activate: ->
      if $(this).css('list-style-type') == 'decimal'
        $(this).data('list-style-type', 'decimal')
        $(this).css('list-style-type', 'disc')

    deactivate: ->
      if $(this).data('list-style-type')
        $(this).css('list-style-type', $(this).data('list-style-type'))

    create: ->
      if $('li:not(.empty)', this).length == 0
        $('li.empty', this).show()
        $(this).css('margin-left', '6px')
    
    over: ->
      $('li.empty', this).hide()
      $(this).css('margin-left', '25px')
    
    receive: ->
      $('li.empty', this).hide()
      $(this).css('margin-left', '25px')

    remove: ->
      if $('li:not(.empty)', this).length == 0
        $('li.empty', this).show()
        $(this).css('margin-left', '6px')
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