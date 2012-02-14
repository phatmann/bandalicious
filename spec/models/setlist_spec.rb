require 'spec_helper'

describe Setlist do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should preserve item order" do
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

