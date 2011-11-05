require 'spec_helper'

describe "shows/new.html.haml" do
  include LoginHelper
  
  before(:each) do
    login_band
    @band = assign(:band, current_band)
    assign(:show, stub_model(Show, :name => 'Name', :band_id => @band.id).as_new_record)
  end

  it "renders new show form" do
    render
    assert_select "form", :action => band_shows_path(@band), :method => "post" do
      assert_select "input#show_name", :name => "show[name]"
    end
  end
end
