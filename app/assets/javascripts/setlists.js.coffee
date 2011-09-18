# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('#available_songs, #selected_songs').sortable(
		connectWith: '.sortable'
		scroll: true,
		axis: 'y',
		stop: ->
			setlistID = $('#selected_songs').data('setlist_id')
			
			$.ajax
				url: '/setlist_songs/sort'
				type: 'post',
				data: "setlist_id=#{setlistID}&" + $('#selected_songs').sortable('serialize'),
				dataType: 'script'
	)

	$('.sortable').disableSelection();