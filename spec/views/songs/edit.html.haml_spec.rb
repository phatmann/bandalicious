require 'spec_helper'

describe "songs/edit.html.haml" do
  include LoginHelper

  before(:each) do
    login_band
    @band = assign(:band, current_band)
    @song = assign(:song, stub_model(Song, :name => 'Name', :band_id => @band.id))
  end

  it "renders the edit song form" do
    render
    assert_select "form", :action => band_songs_path(@band, @song), :method => "post" do
      assert_select "input#song_name", :name => "song[name]"
    end
  end
end
