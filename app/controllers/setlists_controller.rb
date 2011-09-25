class SetlistsController < InheritedResources::Base
	belongs_to :band
	before_filter :fetch_items, :only => [:create, :update]
	before_filter :require_band

	def sort
		setlist = Setlist.find(params['setlist_id'])
		song_ids = params['song'] || []
		
		setlist.setlist_songs = song_ids.map.with_index { |id, index|
			SetlistSong.new(:song_id => id, :position => index + 1)
		}

		setlist.save
		head :created
	end

	def fetch_items
		song_ids = params.delete(:song_ids) || []
		params[:setlist][:items] = song_ids.map{|song_id| SetlistItem.new(:song_id => song_id)}
	end
end
