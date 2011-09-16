require 'spec_helper'

describe "setlist_songs/show.html.haml" do
  before(:each) do
    @setlist_song = assign(:setlist_song, stub_model(SetlistSong,
      :position => 1,
      :song => nil,
      :setlist => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
