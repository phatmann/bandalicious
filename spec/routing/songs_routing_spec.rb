require "spec_helper"

describe SongsController do
  describe "routing" do
    it "routes to #index" do
      get("/bands/1/songs").should route_to("songs#index", :band_id => "1")
    end

    it "routes to #new" do
      get("/bands/1/songs/new").should route_to("songs#new", :band_id => "1")
    end

    it "routes to #song" do
      get("/bands/1/songs/1").should route_to("songs#show", :band_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/1/songs/1/edit").should route_to("songs#edit", :band_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/bands/1/songs").should route_to("songs#create", :band_id => "1")
    end

    it "routes to #update" do
      put("/bands/1/songs/1").should route_to("songs#update", :band_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/1/songs/1").should route_to("songs#destroy", :band_id => "1", :id => "1")
    end
  end
end
