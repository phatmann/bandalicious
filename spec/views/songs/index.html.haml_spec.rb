require 'spec_helper'

describe "songs/index.html.haml" do
  before(:each) do
    assign(:songs, [
      stub_model(Song, :name => "Name"),
      stub_model(Song, :name => "Name")
    ])
  end

  it "renders a list of songs" do
    view.stub(:new_resource_path).and_return("#")
    view.stub(:collection_path).and_return("#")
    render
    assert_select "ul>li", :text => "Name".to_s, :count => 2
  end
end
