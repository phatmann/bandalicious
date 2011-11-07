require 'spec_helper'

describe "Bands" do
  include LoginHelper

  before do
    login_admin_via_form
  end

  describe "/bands" do
    it "shows list of bands" do
      Band.create(
        :name => 'Band1',
        :username => 'band1',
        :password => 'band1pw', :password_confirmation => 'band1pw',
        :email => 'band1@example.com')
      
      visit bands_path
      page.has_content?('Band1')
    end
  end
end
