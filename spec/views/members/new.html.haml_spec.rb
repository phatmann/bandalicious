require 'spec_helper'

describe "band_members/new.html.haml" do
  before(:each) do
    assign(:band_member, stub_model(BandMember,
      :name => "MyString",
      :email => "MyString",
      :cell_phone => "MyString",
      :home_phone => "MyString",
      :work_phone => "MyString",
      :instrument => "MyString",
      :band => ""
    ).as_new_record)
  end

  it "renders new band_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => band_members_path, :method => "post" do
      assert_select "input#band_member_name", :name => "band_member[name]"
      assert_select "input#band_member_email", :name => "band_member[email]"
      assert_select "input#band_member_cell_phone", :name => "band_member[cell_phone]"
      assert_select "input#band_member_home_phone", :name => "band_member[home_phone]"
      assert_select "input#band_member_work_phone", :name => "band_member[work_phone]"
      assert_select "input#band_member_instrument", :name => "band_member[instrument]"
      assert_select "input#band_member_band", :name => "band_member[band]"
    end
  end
end
