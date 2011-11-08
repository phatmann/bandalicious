require "spec_helper"

describe ShowsController do
  describe "routing" do
    it "routes to #index" do
      get("/bands/1/shows").should route_to("shows#index", :band_id => "1")
    end

    it "routes to #new" do
      get("/bands/1/shows/new").should route_to("shows#new", :band_id => "1")
    end

    it "routes to #show" do
      get("/bands/1/shows/1").should route_to("shows#show", :band_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/1/shows/1/edit").should route_to("shows#edit", :band_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/bands/1/shows").should route_to("shows#create", :band_id => "1")
    end

    it "routes to #update" do
      put("/bands/1/shows/1").should route_to("shows#update", :band_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/1/shows/1").should route_to("shows#destroy", :band_id => "1", :id => "1")
    end
  end
end
