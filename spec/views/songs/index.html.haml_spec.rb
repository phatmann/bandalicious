require 'spec_helper'

describe "songs/index.html.haml" do
  before(:each) do
    assign(:songs, [
      stub_model(Song),
      stub_model(Song)
    ])
  end

  it "renders a list of songs" do
    render
  end
end
