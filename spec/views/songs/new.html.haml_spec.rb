require 'spec_helper'

describe "songs/new.html.haml" do
  before(:each) do
    assign(:song, stub_model(Song).as_new_record)
  end

  it "renders new song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => songs_path, :method => "post" do
    end
  end
end
