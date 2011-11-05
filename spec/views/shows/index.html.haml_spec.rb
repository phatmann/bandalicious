require 'spec_helper'

describe "shows/index.html.haml" do
  before(:each) do
    assign(:shows, [
      stub_model(Show, :name => "Name"),
      stub_model(Show, :name => "Name")
    ])
  end

  it "renders a list of shows" do
    view.stub(:new_resource_path).and_return("#")
    view.stub(:edit_resource_path).and_return("#")
    view.stub(:resource_path).and_return("#")
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
