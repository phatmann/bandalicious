require 'spec_helper'

describe "Bands" do
  include LoginHelper

  describe "as admin"
    before do
      login_admin_via_form
    end

    it "shows list of bands for an admin" do
      band = Factory(:band)
      visit bands_path
      page.has_content?(band.name)
    end
  end
end
