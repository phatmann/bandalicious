require "spec_helper"

describe SetlistsController do
  include LoginHelper

  before do
    login_band
  end

  describe "routing" do
    it "routes to #index" do
      get("/bands/#{current_band.id}/setlists").should route_to("setlists#index")
    end

    it "routes to #new" do
      get("/bands/#{current_band.id}/setlists/new").should route_to("setlists#new")
    end

    it "routes to #show" do
      get("/bands/#{current_band.id}/setlists/1").should route_to("setlists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/#{current_band.id}/setlists/1/edit").should route_to("setlists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bands/#{current_band.id}/setlists").should route_to("setlists#create")
    end

    it "routes to #update" do
      put("/bands/#{current_band.id}/setlists/1").should route_to("setlists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/#{current_band.id}/setlists/1").should route_to("setlists#destroy", :id => "1")
    end
  end
end
