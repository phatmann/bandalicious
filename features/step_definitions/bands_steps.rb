When /^I list the bands$/ do
  visit bands_path
end

Then /^I should see the bands$/ do |table|
  table.hashes.each do |attributes|
    page.should have_content(attributes[:name])
  end
end