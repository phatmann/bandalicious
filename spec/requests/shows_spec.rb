require 'spec_helper'

describe "Shows" do
  include LoginHelper

  before do
    login_band
  end

  describe "GET /shows" do
    it "works! (now write some real specs)" do
      get band_shows_path(current_band)
      response.status.should be(200)
    end
  end
end
