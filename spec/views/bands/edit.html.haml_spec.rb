require 'spec_helper'

describe "bands/edit.html.haml" do
  before(:each) do
    @band = assign(:band, stub_model(Band))
  end

  it "renders the edit band form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bands_path(@band), :method => "post" do
    end
  end
end
