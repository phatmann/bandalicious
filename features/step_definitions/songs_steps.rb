Given /^the band has the songs:$/ do |table|
  table.raw.each do |row|
    Song.create(:name => row[0], :band => @current_band)
  end
end

When /^I list the songs$/ do
  visit band_songs_path(@current_band)
end

Then /^I should see the songs:$/ do |table|
  actual_table = all('.song-list ul li').map {|li| [li.find('.name span').text]}
  table.diff!(actual_table)
end

When /^I add a song "(.*)"$/ do |name|
  visit band_songs_path(@current_band)
  click_on "Add song"
  fill_in "Name", :with => name
  click_on "Create Song"
end

When /I turn on song editing/ do
  visit band_songs_path(@current_band)
  click_on "Edit songs"
end

And /I find the song "(.*)"/ do |name|
  @song = find('.name span', :text => name).find(:xpath, '../..')
end

And /I click on the song edit link/ do
  @song.find('a.edit').click
end

And /I click on the song delete link/ do
  @song.find('a.close').click
end

When /^I edit song "(.*)"$/ do |name|
  steps %Q{
    When I turn on song editing
    And I find the song "#{name}"
    And I click on the song edit link
  }
end

When /^I change the name of song to "(.*)"$/ do |name|
  fill_in "Name", :with => name
end

When /^I save the song$/ do
  click_on "Update Song"
end

When /^I delete the song "(.*)"$/ do |name|
  steps %Q{
    When I turn on song editing
    And I find the song "#{name}"
    And I click on the song delete link
  }
end

When /^I drag song "([^"]*)" down one song$/ do |name|
  page.execute_script %Q{
    var song = $(".name span:contains('#{name}')").parent().parent(); 
    song.simulateDragSortable({ move: 1 });
  } 
  sleep 1
end
