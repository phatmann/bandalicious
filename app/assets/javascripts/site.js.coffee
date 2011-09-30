$ ->
  $('.sortable').sortable(
    scroll: true,
    axis: 'y',
    stop: ->
      $.ajax
        url: $(this).data('sort_url')
        type: 'post',
        data: $(this).sortable('serialize'),
        dataType: 'script'
  ).disableSelection;

  $("input.date-picker").datepicker(dateFormat: "yy-mm-dd");

  $("a.print").click(-> print())