Given /^a band is logged in as "(.*)"$/ do |username|
  @current_band = Factory.build(:band,
    :username => username,
    :password => 'generic',
    :email => "#{username}@example.com",
    :admin => (username == 'admin')
  )
  
  @current_band.save_without_session_maintenance

  visit "/"
  fill_in "Username", :with => username 
  fill_in "Password", :with => 'generic'
  click_on "Login"
end

Given /^a band is logged in$/ do
  steps %Q{Given a band is logged in as "sample_band"}
end

Given /^an admin is logged in$/ do
  steps %Q{Given a band is logged in as "admin"}
end

Given /^a band is logged in as "(.*)" without form$/ do |username|
  @current_band = Factory(:band,
    :username => username,
    :password => 'generic',
    :email => "#{username}@example.com",
    :admin => (username == 'admin')
  )
  
  BandSession.create!(@current_band)
end

Given /^a band is logged in without form$/ do
  steps %Q{Given a band is logged in as "sample_band" without form}
end