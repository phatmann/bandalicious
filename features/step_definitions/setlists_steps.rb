When /^I create a new setlist$/ do
  visit band_setlists_path(@current_band)
  click_on 'New setlist'
end

When /^I add "(.*)" to the setlist$/ do |name|
  @song = find('#available-songs .name span', :text => name).find(:xpath, '../..')
  @song.find('a.add').click
end

When /^I save the setlist$/ do
  click_on 'Create Setlist'
end

Then /^I should see a setlist with the songs:$/ do |table|
  pending
end