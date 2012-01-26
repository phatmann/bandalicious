Given /^a band is logged in as "(.*)"$/ do |username|
  @current_band = Factory(:band,
    :username => username,
    :password => 'generic',
    :email => "#{username}@example.com",
    :admin => (username == 'admin')
  )

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