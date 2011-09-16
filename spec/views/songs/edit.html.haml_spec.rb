require 'spec_helper'

describe "songs/edit.html.haml" do
  before(:each) do
    @song = assign(:song, stub_model(Song))
  end

  it "renders the edit song form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => songs_path(@song), :method => "post" do
    end
  end
end
