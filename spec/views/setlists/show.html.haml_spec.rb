require 'spec_helper'

describe "setlists/show.html.haml" do
  before(:each) do
    @setlist = assign(:setlist, stub_model(Setlist))
  end

  it "renders attributes in <p>" do
    render
  end
end
