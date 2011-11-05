require 'spec_helper'

describe "members/new.html.haml" do
  include LoginHelper

  before(:each) do
    login_band
    assign(:band, current_band)
    assign(:member, stub_model(Member,
      :name => "MyString",
      :email => "MyString",
      :cell_phone => "MyString",
      :home_phone => "MyString",
      :work_phone => "MyString",
      :instrument => "MyString",
      :band_id => current_band.id
    ).as_new_record)
  end

  it "renders new member form" do
    render

    assert_select "form", :action => band_members_path(current_band), :method => "post" do
      assert_select "input#member_name", :name => "member[name]"
      assert_select "input#member_email", :name => "member[email]"
      assert_select "input#member_cell_phone", :name => "member[cell_phone]"
      assert_select "input#member_home_phone", :name => "member[home_phone]"
      assert_select "input#member_work_phone", :name => "member[work_phone]"
      assert_select "input#member_instrument", :name => "member[instrument]"
    end
  end
end
