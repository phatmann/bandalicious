require "spec_helper"

describe BandMembersController do
  describe "routing" do

    it "routes to #index" do
      get("/band_members").should route_to("band_members#index")
    end

    it "routes to #new" do
      get("/band_members/new").should route_to("band_members#new")
    end

    it "routes to #show" do
      get("/band_members/1").should route_to("band_members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/band_members/1/edit").should route_to("band_members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/band_members").should route_to("band_members#create")
    end

    it "routes to #update" do
      put("/band_members/1").should route_to("band_members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/band_members/1").should route_to("band_members#destroy", :id => "1")
    end

  end
end
