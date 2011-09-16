class SetlistSongsController < InheritedResources::Base
	def sort
		setlist = Setlist.find(params['setlist_id'])
		song_ids = params['song'] || []
		
		setlist.setlist_songs = song_ids.map.with_index { |id, index|
			SetlistSong.new(:song_id => id, :position => index + 1)
		}

		setlist.save
		head :created
	end
end
