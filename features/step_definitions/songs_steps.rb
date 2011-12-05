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

When /^I change the name of song "([^"]*)" to "([^"]*)"$/ do |name, new_name|
  steps %Q{
    When I turn on song editing
    And I find the song "#{name}"
    And I click on the song edit link
  }
  
  fill_in "Name", :with => new_name
  click_on "Update Song"
end

When /^I delete the song "(.*)"$/ do |name|
  steps %Q{
    When I turn on song editing
    And I find the song "#{name}"
    And I click on the song delete link
  }
end

When /^I move the song "([^"]*)" under "([^"]*)"$/ do |name1, name2|
  page.execute_script %Q{
    var song1 = $(".name span:contains('#{name1}')").parent().parent(); 
    var song2 = $(".name span:contains('#{name2}')").parent().parent();  
    distance_between_elements = song2.offset().top - song1.offset().top;
    height_of_elements = song1.height();
    dy = (distance_between_elements * ($('li.song').size() - 1)) + height_of_elements/2;
    song1.simulate('drag', {dx:0, dy:dy});
  }     
end
