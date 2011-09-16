require 'spec_helper'

describe "bands/index.html.haml" do
  before(:each) do
    assign(:bands, [
      stub_model(Band),
      stub_model(Band)
    ])
  end

  it "renders a list of bands" do
    render
  end
end
