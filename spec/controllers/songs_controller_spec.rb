require 'spec_helper'

describe SongsController do
  include LoginHelper

  before do
    login_band
  end

  def valid_attributes
    {:band_id => current_band.id, :name => 'Name'}
  end

  describe "GET index" do
    it "assigns all songs as @songs" do
      song = Song.create! valid_attributes
      get :index, :band_id => current_band.id
      assigns(:songs).should eq([song])
    end
  end

  describe "GET show" do
    it "assigns the requested song as @song" do
      song = Song.create! valid_attributes
      get :show, :band_id => current_band.id, :id => song.id.to_s
      assigns(:song).should eq(song)
    end
  end

  describe "GET new" do
    it "assigns a new song as @song" do
      get :new, :band_id => current_band.id
      assigns(:song).should be_a_new(Song)
    end
  end

  describe "GET edit" do
    it "assigns the requested song as @song" do
      song = Song.create! valid_attributes
      get :edit, :band_id => current_band.id, :id => song.id.to_s
      assigns(:song).should eq(song)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, :band_id => current_band.id, :song => valid_attributes
        }.to change(Song, :count).by(1)
      end

      it "assigns a newly created song as @song" do
        post :create, :band_id => current_band.id, :song => valid_attributes
        assigns(:song).should be_a(Song)
        assigns(:song).should be_persisted
      end

      it "redirects to the songs list" do
        post :create, :band_id => current_band.id, :song => valid_attributes
        response.should redirect_to(band_songs_url(current_band))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved song as @song" do
        post :create, :band_id => current_band.id, :song => {}
        assigns(:song).should be_a_new(Song)
      end

      it "re-renders the 'new' template" do
        post :create, :band_id => current_band.id, :song => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested song" do
        song = Song.create! valid_attributes
        Song.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :band_id => current_band.id, :id => song.id, :song => {'these' => 'params'}
      end

      it "assigns the requested song as @song" do
        song = Song.create! valid_attributes
        put :update, :band_id => current_band.id, :id => song.id, :song => valid_attributes
        assigns(:song).should eq(song)
      end

      it "redirects to the songs list" do
        song = Song.create! valid_attributes
        put :update, :band_id => current_band.id, :id => song.id, :song => valid_attributes
        response.should redirect_to(band_songs_url(current_band))
      end
    end

    describe "with invalid params" do
      it "assigns the song as @song" do
        song = Song.create! valid_attributes
        put :update, :band_id => current_band.id, :id => song.id.to_s, :song => {:name => ''}
        assigns(:song).should eq(song)
      end

      it "re-renders the 'edit' template" do
        song = Song.create! valid_attributes
        put :update, :band_id => current_band.id, :id => song.id.to_s, :song => {:name => ''}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested song" do
      song = Song.create! valid_attributes
      expect {
        delete :destroy, :band_id => current_band.id, :id => song.id.to_s
      }.to change(Song, :count).by(-1)
    end

    it "redirects to the songs list" do
      song = Song.create! valid_attributes
      delete :destroy, :band_id => current_band.id, :id => song.id.to_s
      response.should redirect_to(band_songs_url(current_band))
    end
  end

end
