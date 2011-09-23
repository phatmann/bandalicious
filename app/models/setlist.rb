class Setlist < ActiveRecord::Base
  belongs_to :band
  belongs_to :show
	has_many :setlist_songs, :order => "position"
	has_many :songs, :through => :setlist_songs

  def available_songs
    self.band.songs - self.songs
  end
end
