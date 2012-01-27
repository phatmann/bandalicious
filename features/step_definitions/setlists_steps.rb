When /^I create a new setlist$/ do
  visit band_setlists_path(@current_band)
  click_on 'New setlist'
end

When /^I add "(.*)" to the setlist(?: by clicking)?$/ do |name|
  song = find_song('#available-songs', name).find('a.add').click
  sleep 1
end

When /^I add "(.*)" to the setlist by dragging$/ do |name|
  song = find_song('#available-songs', name).drag_to(find('#selected-songs'))
end

When /^I add a break to the setlist(?: by clicking)?$/ do
  song = find_break('#breaks').find('a.add').click
end

When /^I add a break to the setlist by dragging$/ do
  song = find_break('#breaks').drag_to(find('#selected-songs'))
end

When /^I save the setlist$/ do
  click_button 'Setlist'
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

Given /^the band has the setlists:$/ do |table|
  table.raw.each do |row|
    s = Setlist.create(:name => row[0], :date => Date.today, :band => @current_band)
  end
end

When /^I edit setlist "(.*)"$/ do |name|
  visit band_setlists_path(@current_band)
  click_on name
  click_on 'Edit setlist'
end

When /^I (?:change|set) the name of the setlist to "(.*)"$/ do |name|
  fill_in "Name", :with => name
end

Then /^the setlist name should show as "(.*)"$/ do |name|
  page.should have_css('h1', :text => name)
end

When /^I list the setlists$/ do
  visit band_setlists_path(@current_band)
end

Then /^I should see the setlists:$/ do |table|
  actual_table = all('.content table td.name').map { |td| [setlist_name_from_title(td.find('a').text)] }
  table.diff!(actual_table)
end

Then /^I should see a setlist with the songs:$/ do |table|
  actual_table = all('.song-list ul li').map {|li| [li.find('.name span').text]}
  table.diff!(actual_table)
end