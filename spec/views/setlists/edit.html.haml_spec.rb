require 'spec_helper'

describe "setlists/edit.html.haml" do
  include LoginHelper

  before(:each) do
    login_band
    @band = assign(:band, current_band)
    @setlist = assign(:setlist, stub_model(Setlist, :name => 'Name', :band_id => @band.id))
  end

  it "renders the edit setlist form" do
    render
    assert_select "form", :action => band_setlists_path(current_band, @setlist), :method => "post" do
      assert_select "input#setlist_name", :name => "setlist[name]"
    end
  end
end
