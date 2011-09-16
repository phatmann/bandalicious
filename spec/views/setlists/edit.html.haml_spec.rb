require 'spec_helper'

describe "setlists/edit.html.haml" do
  before(:each) do
    @setlist = assign(:setlist, stub_model(Setlist))
  end

  it "renders the edit setlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => setlists_path(@setlist), :method => "post" do
    end
  end
end
