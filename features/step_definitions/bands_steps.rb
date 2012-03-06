When /^I list the bands$/ do
  visit bands_path
end

Then /^I should see the bands:$/ do |table|
  actual_table = all('tr').map{|tr| [tr.find('td:first').text]}
  table.diff!(actual_table)
end

When /^I delete the first band$/ do
  click_link('Delete')
end

When /^I sign up with the following info:$/ do |table|
  band_attrs = table.hashes.first
  visit signup_path
  fill_in 'Band name', :with => band_attrs[:name]
  fill_in 'Username',  :with => band_attrs[:username]
  fill_in 'Email',     :with => band_attrs[:email]
  fill_in 'Password',  :with => band_attrs[:password]
  fill_in 'Password confirmation', :with => band_attrs[:password]
  click_on 'Sign Up'
end

Then /^I should see the home page for "(.*)"$/ do |name|
  band = Band.find_by_name(name)
  current_path.should match "/bands/#{band.id}"
  within '.topbar' do
    page.should have_link(name)
  end
end

Given /^the band has the members:$/ do |table|
  table.raw.each do |row|
    Member.create(:name => row[0], :email => row[1], :band => @current_band)
  end
end

When /^I edit band info$/ do
  click_on @current_band.name
end

When /^I change the band name to "(.*)"$/ do |name|
  fill_in 'Band name', :with => name
end

When /^I save the band info$/ do
  click_on 'Update Band Info'
end

Then /^my band should show as "(.*)"$/ do |name|
  first('.secondary-nav li:first a').should have_content(name)
end