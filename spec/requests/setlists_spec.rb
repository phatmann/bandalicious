require 'spec_helper'

describe "Setlists" do
  include LoginHelper

  before do
    login_band
  end

  describe "GET /setlists" do
    it "works! (now write some real specs)" do
      get band_setlists_path(current_band)
      response.status.should be(200)
    end
  end
end
