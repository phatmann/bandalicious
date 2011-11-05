require 'spec_helper'

describe "members/index.html.haml" do
  include LoginHelper

  before(:each) do
    login_band

    @members = assign(:members, [
      stub_model(Member,
        :name => "Name",
        :email => "Email",
        :cell_phone => "Cell Phone",
        :home_phone => "Home Phone",
        :work_phone => "Work Phone",
        :instrument => "Instrument",
        :band_id => current_band.id
      ),
      stub_model(Member,
        :name => "Name",
        :email => "Email",
        :cell_phone => "Cell Phone",
        :home_phone => "Home Phone",
        :work_phone => "Work Phone",
        :instrument => "Instrument",
        :band_id => current_band.id
      )
    ])
  end

  it "renders a list of members" do
    view.stub(:new_resource_path).and_return("#")
    view.stub(:resource_path).and_return("#")
    view.stub(:collection).and_return(@members)
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
