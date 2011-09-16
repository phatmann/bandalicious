require 'spec_helper'

describe "bands/new.html.haml" do
  before(:each) do
    assign(:band, stub_model(Band).as_new_record)
  end

  it "renders new band form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bands_path, :method => "post" do
    end
  end
end
