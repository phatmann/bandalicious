require 'spec_helper'

describe "Bands" do
  include LoginHelper

  before do
    login_admin
  end

  describe "GET /bands" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get bands_path
      response.status.should be(200)
    end
  end
end
