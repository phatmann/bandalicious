$ ->
  $('.sortable').sortable(
    scroll: true
    axis: 'y'
    handle: dragHandle()
    stop: ->
      $.ajax
        url: $(this).data('sort_url')
        type: 'post'
        data: $(this).sortable('serialize')
        dataType: 'script'
  ).disableSelection()

  $("input.date-picker").datepicker(dateFormat: "yy-mm-dd")
  $("a.print").click(-> print();return false)
  $('.handle:visible').addTouch()

# handles only for multi-touch
window.dragHandle = -> if $('.handle:visible').length > 0 then '.handle' else null  
