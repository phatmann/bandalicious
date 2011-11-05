require 'spec_helper'

describe "Members" do
  include LoginHelper

  before do
    login_band
  end

  describe "GET /members" do
    it "works! (now write some real specs)" do
      get band_members_path(current_band)
      response.status.should be(200)
    end
  end
end
