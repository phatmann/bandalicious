require 'spec_helper'

describe ShowsController do
  include LoginHelper

  before do
    login_band
  end

  def valid_attributes
    {:band_id => current_band.id, :name => 'Name'}
  end

  describe "GET index" do
    it "assigns all shows as @shows" do
      show = Show.create! valid_attributes
      get :index, :band_id => current_band.id
      assigns(:shows).should eq([show])
    end
  end

  describe "GET show" do
    it "assigns the requested show as @show" do
      show = Show.create! valid_attributes
      get :show, :band_id => current_band.id, :id => show.id.to_s
      assigns(:show).should eq(show)
    end
  end

  describe "GET new" do
    it "assigns a new show as @show" do
      get :new, :band_id => current_band.id
      assigns(:show).should be_a_new(Show)
    end
  end

  describe "GET edit" do
    it "assigns the requested show as @show" do
      show = Show.create! valid_attributes
      get :edit, :band_id => current_band.id, :id => show.id.to_s
      assigns(:show).should eq(show)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Show" do
        expect {
          post :create, :band_id => current_band.id, :show => valid_attributes
        }.to change(Show, :count).by(1)
      end

      it "assigns a newly created show as @show" do
        post :create, :band_id => current_band.id, :show => valid_attributes
        assigns(:show).should be_a(Show)
        assigns(:show).should be_persisted
      end

      it "redirects to the created show" do
        post :create, :band_id => current_band.id, :show => valid_attributes
        response.should redirect_to([current_band, Show.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved show as @show" do
        post :create, :band_id => current_band.id, :show => {}
        assigns(:show).should be_a_new(Show)
      end

      it "re-renders the 'new' template" do
        post :create, :band_id => current_band.id, :show => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested show" do
        show = Show.create! valid_attributes
        Show.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :band_id => current_band.id, :id => show.id, :show => {'these' => 'params'}
      end

      it "assigns the requested show as @show" do
        show = Show.create! valid_attributes
        put :update, :band_id => current_band.id, :id => show.id, :show => valid_attributes
        assigns(:show).should eq(show)
      end

      it "redirects to the show" do
        show = Show.create! valid_attributes
        put :update, :band_id => current_band.id, :id => show.id, :show => valid_attributes
        response.should redirect_to([current_band, show])
      end
    end

    describe "with invalid params" do
      it "assigns the show as @show" do
        show = Show.create! valid_attributes
        put :update, :band_id => current_band.id, :id => show.id.to_s, :show => {:name => ''}
        assigns(:show).should eq(show)
      end

      it "re-renders the 'edit' template" do
        show = Show.create! valid_attributes
        put :update, :band_id => current_band.id, :id => show.id.to_s, :show => {:name => ''}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested show" do
      show = Show.create! valid_attributes
      expect {
        delete :destroy, :band_id => current_band.id, :id => show.id.to_s
      }.to change(Show, :count).by(-1)
    end

    it "redirects to the shows list" do
      show = Show.create! valid_attributes
      delete :destroy, :band_id => current_band.id, :id => show.id.to_s
      response.should redirect_to(band_shows_url(current_band))
    end
  end
end
