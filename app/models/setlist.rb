class Setlist < ActiveRecord::Base
	belongs_to :band
	has_and_belongs_to_many :songs
	has_many :shows

	def name
		self.id
	end
end
