require "spec_helper"

describe MembersController do
  describe "routing" do
    it "routes to #index" do
      get("/bands/1/members").should route_to("members#index", :band_id => "1")
    end

    it "routes to #new" do
      get("/bands/1/members/new").should route_to("members#new", :band_id => "1")
    end

    it "routes to #show" do
      get("/bands/1/members/1").should route_to("members#show", :band_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/bands/1/members/1/edit").should route_to("members#edit", :band_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/bands/1/members").should route_to("members#create", :band_id => "1")
    end

    it "routes to #update" do
      put("/bands/1/members/1").should route_to("members#update", :band_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bands/1/members/1").should route_to("members#destroy", :band_id => "1", :id => "1")
    end
  end
end
