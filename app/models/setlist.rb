class Setlist < ActiveRecord::Base
  belongs_to :band
  belongs_to :show
	has_many :items, :class_name => 'SetlistItem', :order => 'position', :dependent => :destroy
  validates_presence_of :name
  
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

# == Schema Information
#
# Table name: setlists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  band_id    :integer
#  show_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  date       :date
#

