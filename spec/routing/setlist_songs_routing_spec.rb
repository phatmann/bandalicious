require "spec_helper"

describe SetlistSongsController do
  describe "routing" do

    it "routes to #index" do
      get("/setlist_songs").should route_to("setlist_songs#index")
    end

    it "routes to #new" do
      get("/setlist_songs/new").should route_to("setlist_songs#new")
    end

    it "routes to #show" do
      get("/setlist_songs/1").should route_to("setlist_songs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/setlist_songs/1/edit").should route_to("setlist_songs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/setlist_songs").should route_to("setlist_songs#create")
    end

    it "routes to #update" do
      put("/setlist_songs/1").should route_to("setlist_songs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/setlist_songs/1").should route_to("setlist_songs#destroy", :id => "1")
    end

  end
end
