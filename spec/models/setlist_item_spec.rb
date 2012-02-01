require 'spec_helper'

describe SetlistItem do
  it "should preserve its order" do
    setlist       = FactoryGirl.build(:setlist)
    songs         = FactoryGirl.create_list(:song, 3)
    setlist.items = songs.map{|song| SetlistItem.new(:song_id => song.id)}
    setlist.save
    setlist.reload
    setlist.items.each_with_index{|item, i| item.id.should == songs[i].id}
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

