require 'spec_helper'

describe "shows/edit.html.haml" do
  include LoginHelper

  before(:each) do
    login_band
    @band = assign(:band, current_band)
    @show = assign(:show, stub_model(Show, :name => 'Name', :band_id => @band.id))
  end

  it "renders the edit show form" do
    render
    assert_select "form", :action => band_shows_path(@band, @show), :method => "post" do
      assert_select "input#show_name", :name => "show[name]"
    end
  end
end
