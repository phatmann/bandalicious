require "spec_helper"

describe SetlistsController do
  describe "routing" do
    it "routes to #index" do
      get("/bands/1/setlists").should route_to("setlists#index", :band_id => "1")
    end

    it "routes to #new" do
      get("/bands/1/setlists/new").should route_to("setlists#new", :band_id => "1")
    end

    it "routes to #show" do
      get("/bands/1/setlists/1").should route_to("setlists#show", :band_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/1/setlists/1/edit").should route_to("setlists#edit", :band_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/bands/1/setlists").should route_to("setlists#create", :band_id => "1")
    end

    it "routes to #update" do
      put("/bands/1/setlists/1").should route_to("setlists#update", :band_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/1/setlists/1").should route_to("setlists#destroy", :band_id => "1", :id => "1")
    end
  end
end
