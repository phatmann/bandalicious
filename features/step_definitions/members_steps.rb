When /^I add a member "([^"]*)" with email "([^"]*)"$/ do |name, email|
  visit band_members_path(@current_band)
  click_on 'Add band member'
  fill_in 'Name', :with => name
  fill_in 'Email', :with => email
  click_on 'Create Member'
end

Then /^I should see the members:$/ do |table|
  actual_table = all('.content table tr').map{ |tr|
    next if tr.first('th')
    [tr.find('td:first a').text, tr.find('td:last').text]
  }.compact
  table.diff!(actual_table)
end

When /^I delete the member "(.*)"$/ do |name|
  visit band_members_path(@current_band)
  click_on name
  with_confirmation { click_on 'Delete band member' }
end

When /^I edit the member "(.*)"$/ do |name|
  visit band_members_path(@current_band)
  click_on name
  click_on 'Edit band member'
end

When /^I change the name of the member to "(.*)"$/ do |name|
  fill_in "Name", :with => name
end

When /^I change the email of the member to "(.*)"$/ do |email|
  fill_in "Email", :with => email
end

When /^I save the member$/ do
  click_on "Update Member"
end

When /^I list the members$/ do
  visit band_members_path(@current_band)
end