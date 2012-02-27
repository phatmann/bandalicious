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