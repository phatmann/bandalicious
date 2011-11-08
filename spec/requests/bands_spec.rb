require 'spec_helper'

describe "Bands" do
  include LoginHelper

  before do
    login_admin_via_form
  end

  describe "/bands" do
    it "shows list of bands" do
      band = Factory(:band)
      visit bands_path
      page.has_content?(band.name)
    end
  end
end
