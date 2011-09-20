class Setlist < ActiveRecord::Base
	has_many :setlist_songs, :order => "position"
	has_many :songs, :through => :setlist_songs
	belongs_to :show
end
