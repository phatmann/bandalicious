Given /^the band has the setlists:$/ do |table|
  table.raw.each do |row|
    s = Setlist.create(:name => row[0], :date => Date.today, :band => @current_band)
  end
end

Given /^the band has a setlist "(.*)" with the songs:$/ do |name, table|
  setlist = Setlist.create(:name => name, :band => @current_band)
  table.raw.each do |row|
    song = Song.create(:name => row[0], :band => @current_band)
    item = SetlistItem.create(:song_id => song.id, :setlist_id => setlist.id)
  end
end

When /^I create a new setlist$/ do
  visit band_setlists_path(@current_band)
  click_on 'New setlist'
end

When /^I add "(.*)" to the setlist(?: by clicking)?$/ do |name|
  find_song('#available-songs', name).find('a.add').click
  wait_until{ has_song('#selected-songs', name) }
end

When /^I add "(.*)" to the setlist by dragging$/ do |name|
  find_song('#available-songs', name).drag_to(find('#selected-songs'))
end

When /^I add a break to the setlist(?: by clicking)?$/ do
  find_break('#breaks').find('a.add').click
  wait_until{ has_break('#selected-songs') }
end

When /^I add a break to the setlist by dragging$/ do
  song = find_break('#breaks').drag_to(find('#selected-songs'))
end

When /^I save the setlist$/ do
  click_button 'Setlist'
end

Then /^I should see "(.*)" in the selected songs list$/ do |name|
  has_song('#selected-songs', name).should be_true
end

Then /^I should not see "(.*)" in the available songs list$/ do |name|
  has_song('#available-songs', name).should be_false
end

Then /^I should not see "(.*)" in the selected songs list$/ do |name|
  has_song('#selected-songs', name).should be_false
end

Then /^I should see "(.*)" in the available songs list$/ do |name|
  has_song('#available-songs', name).should be_true
end

Then /^I should see a break in the selected songs list$/ do
  has_break('#selected-songs').should be_true
end

Then /^I should not see a break in the selected songs list$/ do
  has_break('#selected-songs').should be_false
end

Then /^I should see a break above the available songs list$/ do
  page.should have_css('#breaks .break')
end

When /^I edit the setlist "(.*)"$/ do |name|
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

When /^I view the setlist "(.*)"$/ do |name|
  click_on name
end

Then /^I should see the setlists:$/ do |table|
  actual_table = all('.content table td.name').map { |td| [setlist_name_from_title(td.find('a').text)] }
  table.diff!(actual_table)
end

Then /^I should see a setlist with the songs:$/ do |table|
  actual_table = all('.song-list ul li').map {|li| [li.find('.name span').text]}
  table.diff!(actual_table)
end

When /^I remove "(.*)"(?: by clicking)?$/ do |name|
  find_song('#selected-songs', name).find('a.close').click
  wait_until{ !has_song('#selected-songs', name) }
end

When /^I remove "(.*)" by dragging$/ do |name|
  find_song('#selected-songs', name).drag_to(find('#available-songs'))
end

When /^I remove the break(?: by clicking)?$/ do
  find_break('#selected-songs').find('a.close').click
  wait_until{ !has_break('#selected-songs') }
end

When /^I remove the break by dragging$/ do
  find_break('#selected-songs').drag_to(find('#available-songs'))
end

When /^I drag "([^"]*)" down one song$/ do |name|
  page.execute_script %Q{
    var song = $(".name span:contains('#{name}')").parent().parent(); 
    song.simulateDragSortable({ move: 1, listItem:'li:not(.no-sort)', tolerance:'pointer' });
  } 
  sleep 1
end