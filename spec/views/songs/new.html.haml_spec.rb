require 'spec_helper'

describe "songs/new.html.haml" do
  include LoginHelper
  
  before(:each) do
    login_band
    @band = assign(:band, current_band)
    assign(:song, stub_model(Song, :name => 'Name', :band_id => @band.id).as_new_record)
  end

  it "renders new song form" do
    render
    assert_select "form", :action => band_songs_path(@band), :method => "post" do
      assert_select "input#song_name", :name => "song[name]"
    end
  end
end
