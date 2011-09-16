class SetlistSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :setlist
  acts_as_list :scope => :setlist
end
