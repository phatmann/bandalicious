require 'spec_helper'

describe SetlistsController do
  include LoginHelper

  before do
    login_band
  end

  def valid_attributes
    {:band_id => current_band.id, :name => 'Name'}
  end

  describe "GET index" do
    it "assigns all setlists as @setlists" do
      setlist = Setlist.create! valid_attributes
      get :index, :band_id => current_band.id
      assigns(:setlists).should eq([setlist])
    end
  end

  describe "GET show" do
    it "assigns the requested setlist as @setlist" do
      setlist = Setlist.create! valid_attributes
      get :show, :band_id => current_band.id, :id => setlist.id.to_s
      assigns(:setlist).should eq(setlist)
    end
  end

  describe "GET new" do
    it "assigns a new setlist as @setlist" do
      get :new, :band_id => current_band.id
      assigns(:setlist).should be_a_new(Setlist)
    end
  end

  describe "GET edit" do
    it "assigns the requested setlist as @setlist" do
      setlist = Setlist.create! valid_attributes
      get :edit, :band_id => current_band.id, :id => setlist.id.to_s
      assigns(:setlist).should eq(setlist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Setlist" do
        expect {
          post :create, :band_id => current_band.id, :setlist => valid_attributes
        }.to change(Setlist, :count).by(1)
      end

      it "includes items with setlist"

      it "assigns a newly created setlist as @setlist" do
        post :create, :band_id => current_band.id, :setlist => valid_attributes
        assigns(:setlist).should be_a(Setlist)
        assigns(:setlist).should be_persisted
      end

      it "redirects to the created setlist" do
        post :create, :band_id => current_band.id, :setlist => valid_attributes
        response.should redirect_to([current_band, Setlist.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved setlist as @setlist" do
        post :create, :band_id => current_band.id, :setlist => {}
        assigns(:setlist).should be_a_new(Setlist)
      end

      it "re-renders the 'new' template" do
        post :create, :band_id => current_band.id, :setlist => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested setlist" do
        setlist = Setlist.create! valid_attributes
        Setlist.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :band_id => current_band.id, :id => setlist.id, :setlist => {'these' => 'params'}
      end

      it "assigns the requested setlist as @setlist" do
        setlist = Setlist.create! valid_attributes
        put :update, :band_id => current_band.id, :id => setlist.id, :setlist => valid_attributes
        assigns(:setlist).should eq(setlist)
      end

      it "redirects to the setlist" do
        setlist = Setlist.create! valid_attributes
        put :update, :band_id => current_band.id, :id => setlist.id, :setlist => valid_attributes
        response.should redirect_to([current_band, setlist])
      end
    end

    describe "with invalid params" do
      it "assigns the setlist as @setlist" do
        setlist = Setlist.create! valid_attributes
        put :update, :band_id => current_band.id, :id => setlist.id.to_s, :setlist => {:name => ''}
        assigns(:setlist).should eq(setlist)
      end

      it "re-renders the 'edit' template" do
        setlist = Setlist.create! valid_attributes
        put :update, :band_id => current_band.id, :id => setlist.id.to_s, :setlist => {:name => ''}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested setlist" do
      setlist = Setlist.create! valid_attributes
      expect {
        delete :destroy, :band_id => current_band.id, :id => setlist.id.to_s
      }.to change(Setlist, :count).by(-1)
    end

    it "redirects to the setlists list" do
      setlist = Setlist.create! valid_attributes
      delete :destroy, :band_id => current_band.id, :id => setlist.id.to_s
      response.should redirect_to(band_setlists_url(current_band))
    end
  end
end
