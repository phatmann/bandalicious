class Setlist < ActiveRecord::Base
	belongs_to :band
	has_many :setlist_songs, :order => "position"
	has_many :songs, :through => :setlist_songs
	has_many :shows

	def name
		self.id
	end
end
