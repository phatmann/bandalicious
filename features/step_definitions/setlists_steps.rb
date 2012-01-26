When /^I create a new setlist$/ do
  visit band_setlists_path(@current_band)
  click_on 'New setlist'
end

When /^I add "(.*)" to setlist by clicking$/ do |name|
  @song = find('#available-songs .name span', :text => name).find(:xpath, '../..')
  @song.find('a.add').click
end

When /^I add "(.*)" to setlist by dragging$/ do |name|
  pending
end

When /^I add a break to setlist by clicking$/ do
  @song = find('#breaks .name span').find(:xpath, '../..')
  @song.find('a.add').click
end

When /^I add a break to setlist by dragging$/ do
  pending
end

When /^I save the setlist$/ do
  click_on 'Create Setlist'
end

Then /^I should see a setlist with the songs:$/ do |table|
  pending
end

Then /^I should see "(.*)" in the selected songs list$/ do |name|
  page.should have_css('#selected-songs .name span', :text => name)
end

Then /^I should not see "(.*)" in the available songs list$/ do |name|
  pending
end

Then /^I should see a break in the selected songs list$/ do
  pending
end

Then /^I should see a break above the available songs list$/ do
  pending
end