class SetlistsController < InheritedResources::Base
	belongs_to :band
	before_filter :update_songs, :only => [:create, :update]
	before_filter :require_band

	def update_songs
		song_ids = params.delete(:song_ids) || []
		params[:setlist][:songs] = song_ids.map{|id| Song.find(id)}
	end

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
