require "spec_helper"

describe SongsController do
  include LoginHelper

  before do
    login_band
  end

  describe "routing" do
    it "routes to #index" do
      get("/bands/#{current_band.id}/songs").should route_to("songs#index")
    end

    it "routes to #new" do
      get("/bands/#{current_band.id}/songs/new").should route_to("songs#new")
    end

    it "routes to #show" do
      get("/bands/#{current_band.id}/songs/1").should route_to("songs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/#{current_band.id}/songs/1/edit").should route_to("songs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bands/#{current_band.id}/songs").should route_to("songs#create")
    end

    it "routes to #update" do
      put("/bands/#{current_band.id}/songs/1").should route_to("songs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/#{current_band.id}/songs/1").should route_to("songs#destroy", :id => "1")
    end

  end
end
