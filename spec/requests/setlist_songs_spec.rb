require 'spec_helper'

describe "SetlistSongs" do
  describe "GET /setlist_songs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get setlist_songs_path
      response.status.should be(200)
    end
  end
end
