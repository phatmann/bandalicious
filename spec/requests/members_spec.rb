require 'spec_helper'

describe "Members" do
  include LoginHelper

  before do
    login_band_via_form
  end

  describe "/bands/members" do
    it "shows list of band members" do
      member = Factory(:member, :band => current_band)
      visit band_members_path(current_band)
      page.has_content?(member.name)
    end
  end
end
