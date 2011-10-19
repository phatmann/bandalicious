class SetlistsController < InheritedResources::Base
	belongs_to :band
	before_filter :fetch_items, :only => [:create, :update]
	before_filter :require_band
	custom_actions :resource => [:duplicate, :sort, :email]

	def sort
		item_ids = params['setlist_item'] || []

		item_ids.each_with_index do |item_id, index|
			item = SetlistItem.find(item_id)
			item.position = index + 1
			item.save
		end

		head :created
	end

	def duplicate
		setlist = resource
		setlist_copy = setlist.dup
		setlist_copy.name = '(copy) ' + setlist.name
		setlist_copy.show = nil
		setlist_copy.items = setlist.items.map{|item| item.dup}
		setlist_copy.save
		redirect_to edit_resource_url(setlist_copy)
	end

	def email
		setlist = resource

		if @band.member_emails.blank?
			redirect_to edit_band_url(@band), :notice => 'Please fill in the band member emails.'
		else
			SongMailer.setlist_email(@band.member_emails, setlist).deliver
			redirect_to resource_url(setlist), :notice => 'Email sent.'
		end
	end

	private
		def fetch_items
			song_ids = params.delete(:song_ids) || []
			params[:setlist][:items] = song_ids.map{|song_id| SetlistItem.new(:song_id => song_id)}
		end
end
