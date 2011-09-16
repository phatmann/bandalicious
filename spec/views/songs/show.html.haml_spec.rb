require 'spec_helper'

describe "songs/show.html.haml" do
  before(:each) do
    @song = assign(:song, stub_model(Song))
  end

  it "renders attributes in <p>" do
    render
  end
end
