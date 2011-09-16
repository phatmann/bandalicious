require 'spec_helper'

describe "bands/show.html.haml" do
  before(:each) do
    @band = assign(:band, stub_model(Band))
  end

  it "renders attributes in <p>" do
    render
  end
end
