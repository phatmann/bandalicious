require 'spec_helper'

describe BandsController do
  include LoginHelper

  before do
    login_admin
  end

  def valid_attributes
    {:name => 'Band', :username => 'band', :email => 'user@example.com',
     :password => 'password', :password_confirmation => 'password'}
  end

  describe "GET index" do
    it "assigns all bands as @bands" do
      band = Band.create! valid_attributes
      get :index
      assigns(:bands).should eq([band])
    end
  end

  describe "GET show" do
    it "assigns the requested band as @band" do
      band = Band.create! valid_attributes
      get :show, :id => band.id.to_s
      assigns(:band).should eq(band)
    end
  end

  describe "GET new" do
    it "assigns a new band as @band" do
      get :new
      assigns(:band).should be_a_new(Band)
    end
  end

  describe "GET edit" do
    it "assigns the requested band as @band" do
      band = Band.create! valid_attributes
      get :edit, :id => band.id.to_s
      assigns(:band).should eq(band)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Band" do
        expect {
          post :create, :band => valid_attributes
        }.to change(Band, :count).by(1)
      end

      it "assigns a newly created band as @band" do
        post :create, :band => valid_attributes
        assigns(:band).should be_a(Band)
        assigns(:band).should be_persisted
      end

      it "redirects home" do
        post :create, :band => valid_attributes
        response.should redirect_to('/')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved band as @band" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        post :create, :band => {}
        assigns(:band).should be_a_new(Band)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, :band => {}
        response.should_not redirect_to('/')
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested band" do
        band = Band.create! valid_attributes
        # Assuming there are no other bands in the database, this
        # specifies that the Band created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Band.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => band.id, :band => {'these' => 'params'}
      end

      it "assigns the requested band as @band" do
        band = Band.create! valid_attributes
        put :update, :id => band.id, :band => valid_attributes
        assigns(:band).should eq(band)
      end

      it "redirects home" do
        band = Band.create! valid_attributes
        put :update, :id => band.id, :band => valid_attributes
        response.should redirect_to('/')
      end
    end

    describe "with invalid params" do
      it "assigns the band as @band" do
        band = Band.create! valid_attributes
        put :update, :id => band.id.to_s, :band => {:name => ''}
        assigns(:band).should eq(band)
      end

      it "re-renders the 'edit' template" do
        band = Band.create! valid_attributes
        put :update, :id => band.id.to_s, :band => {:name => ''}
        response.should_not redirect_to('/')
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested band" do
      band = Band.create! valid_attributes
      expect {
        delete :destroy, :id => band.id.to_s
      }.to change(Band, :count).by(-1)
    end

    it "redirects to the bands list" do
      band = Band.create! valid_attributes
      delete :destroy, :id => band.id.to_s
      response.should redirect_to(bands_url)
    end
  end

end
