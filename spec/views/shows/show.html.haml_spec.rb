require 'spec_helper'

describe "shows/show.html.haml" do
  before(:each) do
    @show = assign(:show, stub_model(Show, :name => 'Name'))
  end

  it "renders attributes in <p>" do
    view.stub(:edit_resource_path).and_return("#")
    render
    rendered.should match(/Name/)
  end
end
