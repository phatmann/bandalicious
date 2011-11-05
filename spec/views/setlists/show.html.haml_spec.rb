require 'spec_helper'

describe "setlists/show.html.haml" do
  before(:each) do
    @items = [stub_model(SetlistItem, :name => 'Name')]
    @setlist = assign(:setlist, stub_model(Setlist, :name => 'Name', :items => @items))
  end

  it "renders attributes in <p>" do
    view.stub(:edit_resource_path).and_return("#")
    view.stub(:email_resource_path).and_return("#")
    render
    rendered.should match(/Name/)
  end
end
