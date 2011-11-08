require 'spec_helper'

describe "Shows" do
  include LoginHelper

  before do
    login_band_via_form
  end

  describe "/bands/shows" do
    it "shows list of shows" do
      show = Factory(:show, :band => current_band)
      visit band_shows_path(current_band)
      page.has_content?(show.name)
    end
  end
end
