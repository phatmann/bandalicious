When /^I create a new setlist$/ do
  visit band_setlists_path(@current_band)
  click_on 'New setlist'
end

When /^I add "(.*)" to setlist by clicking$/ do |name|
  song = find_song('#available-songs', name).find('a.add').click
end

When /^I add "(.*)" to setlist by dragging$/ do |name|
  song = find_song('#available-songs', name).drag_to(find('#selected-songs'))
end

When /^I add a break to setlist by clicking$/ do
  song = find_break('#breaks').find('a.add').click
end

When /^I add a break to setlist by dragging$/ do
  song = find_break('#breaks').drag_to(find('#selected-songs'))
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
  page.should_not have_css('#available-songs .name span', :text => name)
end

Then /^I should see a break in the selected songs list$/ do
  page.should have_css('#selected-songs .break')
end

Then /^I should see a break above the available songs list$/ do
  page.should have_css('#breaks .break')
end