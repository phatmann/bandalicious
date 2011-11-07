require 'authlogic/test_case'

module LoginHelper
  include Authlogic::TestCase

  @@current_band = nil

  def create_band(attrs = {})
    attrs = attrs.merge(:name => 'LoginBand', :username => 'login_band', :email => 'login_user@example.com',
                        :password => 'password', :password_confirmation => 'password')
    @@current_band = Band.create(attrs)
  end

  def login_band(attrs = {})
    create_band(attrs)
    activate_authlogic
    BandSession.create(@@current_band)
  end

  def login_band_via_form(attrs = {})
    create_band(attrs)
    visit('/')
    fill_in('Username', :with => @@current_band.username)
    fill_in('Password', :with => @@current_band.password)
    click_on('Login')
  end

  def login_admin
    login_band(:admin => true)
  end

  def login_admin_via_form
    login_band_via_form(:admin => true)
  end

  def current_band
    @@current_band
  end
end