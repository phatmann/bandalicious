require 'spec_helper'

describe "setlist_songs/edit.html.haml" do
  before(:each) do
    @setlist_song = assign(:setlist_song, stub_model(SetlistSong,
      :position => 1,
      :song => nil,
      :setlist => nil
    ))
  end

  it "renders the edit setlist_song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => setlist_songs_path(@setlist_song), :method => "post" do
      assert_select "input#setlist_song_position", :name => "setlist_song[position]"
      assert_select "input#setlist_song_song", :name => "setlist_song[song]"
      assert_select "input#setlist_song_setlist", :name => "setlist_song[setlist]"
    end
  end
end
