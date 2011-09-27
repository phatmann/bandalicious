class Setlist < ActiveRecord::Base
  belongs_to :band
  belongs_to :show
	has_many :items, :class_name => 'SetlistItem', :order => 'position', :dependent => :destroy

  def songs
    self.items.map {|item| item.song}.compact
  end

  def available_songs
    self.band.songs - self.songs
  end

  def available_items
    self.available_songs.map{ |song| SetlistItem.new(:song => song) }
  end
end
