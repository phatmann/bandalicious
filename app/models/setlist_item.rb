class SetlistItem < ActiveRecord::Base
  belongs_to :song
  belongs_to :setlist
  acts_as_list :scope => :setlist

  def name
    self.song ? song.name : super
  end
end
