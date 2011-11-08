require 'spec_helper'

describe "Setlists" do
  include LoginHelper

  before do
    login_band_via_form
  end

  describe "/bands/setlists" do
    it "shows list of setlists" do
      setlist = Factory(:setlist, :band => current_band)
      visit band_setlists_path(current_band)
      page.has_content?(setlist.name)
    end
  end
end
