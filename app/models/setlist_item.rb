class SetlistItem < ActiveRecord::Base
  belongs_to :song
  belongs_to :setlist
  acts_as_list :scope => :setlist

  def name
    self.song ? self.song.name : super
  end

  def song_id
    super || 0
  end

  def song_id=(id)
    super(id == 0 ? nil : id)
  end

  def self.break
    SetlistItem.new
  end
end

# == Schema Information
#
# Table name: setlist_items
#
#  id         :integer         not null, primary key
#  position   :integer
#  song_id    :integer
#  setlist_id :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

