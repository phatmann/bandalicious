require 'spec_helper'

describe "setlists/index.html.haml" do
  before(:each) do
    @setlists = assign(:setlists, [
      stub_model(Setlist, :name => "Name"),
      stub_model(Setlist, :name => "Name")
    ])
  end

  it "renders a list of setlists" do
    view.stub(:new_resource_path).and_return("#")
    view.stub(:duplicate_resource_path).and_return("#")
    view.stub(:resource_path).and_return("#")
    view.stub(:collection).and_return(@setlists)
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
