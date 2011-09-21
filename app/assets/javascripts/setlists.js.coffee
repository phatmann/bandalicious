$ ->
	$('#available_songs, #selected_songs').sortable(
		connectWith: '.draggable'
		scroll: true,
		tolerance: 'pointer'
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