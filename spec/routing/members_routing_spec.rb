require "spec_helper"

describe MembersController do
  include LoginHelper

  before do
    login_band
  end

  describe "routing" do
    it "routes to #index" do
      get("/bands/#{current_band.id}/members").should route_to("members#index")
    end

    it "routes to #new" do
      get("/bands/#{current_band.id}/members/new").should route_to("members#new")
    end

    it "routes to #show" do
      get("/bands/#{current_band.id}/members/1").should route_to("members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/#{current_band.id}/members/1/edit").should route_to("members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bands/#{current_band.id}/members").should route_to("members#create")
    end

    it "routes to #update" do
      put("/bands/#{current_band.id}/members/1").should route_to("members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/#{current_band.id}/members/1").should route_to("members#destroy", :id => "1")
    end
  end
end
