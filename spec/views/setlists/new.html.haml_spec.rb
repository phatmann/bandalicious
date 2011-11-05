require 'spec_helper'

describe "setlists/new.html.haml" do
  include LoginHelper
  
  before(:each) do
    login_band
    @band = assign(:band, current_band)
    assign(:setlist, stub_model(Setlist, :name => 'Name', :band_id => @band.id).as_new_record)
  end

  it "renders new setlist form" do
    render
    assert_select "form", :action => band_setlists_path(@band), :method => "post" do
      assert_select "input#setlist_name", :name => "setlist[name]"
    end
  end
end
