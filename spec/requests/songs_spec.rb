require 'spec_helper'

describe "Songs" do
  include LoginHelper

  before do
    login_band_via_form
  end

  describe "/bands/songs" do
    it "shows list of songs" do
      song = Factory(:song, :band => current_band)
      visit band_songs_path(current_band)
      page.has_content?(song.name)
    end
  end
end