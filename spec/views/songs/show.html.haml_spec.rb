require 'spec_helper'

describe "songs/show.html.haml" do
  before(:each) do
    @song = assign(:song, stub_model(Song, :name => 'Name'))
  end

  it "renders attributes in <p>" do
    view.stub(:edit_resource_path).and_return("#")
    render
    rendered.should match(/Name/)
  end
end
