require 'spec_helper'

describe "setlists/index.html.haml" do
  before(:each) do
    assign(:setlists, [
      stub_model(Setlist),
      stub_model(Setlist)
    ])
  end

  it "renders a list of setlists" do
    render
  end
end
