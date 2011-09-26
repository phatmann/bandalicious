class SetlistsController < InheritedResources::Base
	belongs_to :band
	before_filter :fetch_items, :only => [:create, :update]
	before_filter :require_band

	def sort
		setlist = Setlist.find(params['id'])
		setlist.items = song_ids_to_items(params['song'])
		setlist.save

		head :created
	end

	def fetch_items
		params[:setlist][:items] = song_ids_to_items(params.delete(:song_ids))
	end

	private
		def song_ids_to_items(song_ids)
			return [] unless song_ids
			song_ids.map{|song_id| SetlistItem.new(:song_id => song_id)}
		end
end
