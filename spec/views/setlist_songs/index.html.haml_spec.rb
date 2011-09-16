require 'spec_helper'

describe "setlist_songs/index.html.haml" do
  before(:each) do
    assign(:setlist_songs, [
      stub_model(SetlistSong,
        :position => 1,
        :song => nil,
        :setlist => nil
      ),
      stub_model(SetlistSong,
        :position => 1,
        :song => nil,
        :setlist => nil
      )
    ])
  end

  it "renders a list of setlist_songs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
