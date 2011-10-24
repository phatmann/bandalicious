require 'spec_helper'

describe "BandMembers" do
  describe "GET /band_members" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get band_members_path
      response.status.should be(200)
    end
  end
end
