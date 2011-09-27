class SetlistsController < InheritedResources::Base
	belongs_to :band
	before_filter :fetch_items, :only => [:create, :update]
	before_filter :require_band

	def sort
		item_ids = params['setlist_item'] || []

		item_ids.each_with_index do |item_id, index|
			item = SetlistItem.find(item_id)
			item.position = index + 1
			item.save
		end

		head :created
	end

	def fetch_items
		song_ids = params.delete(:song_ids) || []
		params[:setlist][:items] = song_ids.map{|song_id| SetlistItem.new(:song_id => song_id)}
	end
end
