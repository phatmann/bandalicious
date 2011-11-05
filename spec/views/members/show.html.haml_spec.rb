require 'spec_helper'

describe "members/show.html.haml" do
  include LoginHelper

  before(:each) do
    login_band
    @member = assign(:member, stub_model(Member,
      :name => "Name",
      :email => "Email",
      :cell_phone => "Cell Phone",
      :home_phone => "Home Phone",
      :work_phone => "Work Phone",
      :instrument => "Instrument",
      :band_id => current_band.id
    ))
  end

  it "renders attributes in <p>" do
    view.stub(:resource_path).and_return("#")
    view.stub(:edit_resource_path).and_return("#")
    render
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Cell Phone/)
    rendered.should match(/Home Phone/)
    rendered.should match(/Work Phone/)
    rendered.should match(/Instrument/)
    rendered.should match(//)
  end
end
