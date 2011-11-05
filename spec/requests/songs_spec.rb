require 'spec_helper'

describe "Songs" do
  include LoginHelper

  before do
    login_band
  end

  describe "GET /songs" do
    it "works! (now write some real specs)" do
      get band_songs_path(current_band)
      response.status.should be(200)
    end
  end
end
