require 'spec_helper'

describe MembersController do
  include LoginHelper

  before do
    login_band
  end

  def valid_attributes
    {:name => 'Name', :band_id => current_band.id}
  end

  describe "GET index" do
    it "assigns all members as @members" do
      member = Member.create! valid_attributes
      get :index, :band_id => current_band.id
      assigns(:members).should eq([member])
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :show, :band_id => current_band.id, :id => member.id.to_s
      assigns(:member).should eq(member)
    end
  end

  describe "GET new" do
    it "assigns a new member as @member" do
      get :new, :band_id => current_band.id
      assigns(:member).should be_a_new(Member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :edit, :band_id => current_band.id, :id => member.id.to_s
      assigns(:member).should eq(member)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, :band_id => current_band.id, :member => valid_attributes
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created member as @member" do
        post :create, :band_id => current_band.id, :member => valid_attributes
        assigns(:member).should be_a(Member)
        assigns(:member).should be_persisted
      end

      it "redirects to the members list" do
        post :create, :band_id => current_band.id, :member => valid_attributes
        response.should redirect_to(band_members_url(current_band))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved member as @member" do
        post :create, :band_id => current_band.id, :member => {}
        assigns(:member).should be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        post :create, :band_id => current_band.id, :member => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested member" do
        member = Member.create! valid_attributes
        Member.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :band_id => current_band.id, :id => member.id, :member => {'these' => 'params'}
      end

      it "assigns the requested member as @member" do
        member = Member.create! valid_attributes
        put :update, :band_id => current_band.id, :id => member.id, :member => valid_attributes
        assigns(:member).should eq(member)
      end

      it "redirects to the members list" do
        member = Member.create! valid_attributes
        put :update, :band_id => current_band.id, :id => member.id, :member => valid_attributes
        response.should redirect_to(band_members_url(current_band))
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        member = Member.create! valid_attributes
        put :update, :band_id => current_band.id, :id => member.id.to_s, :member => {:name => ''}
        assigns(:member).should eq(member)
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        put :update, :band_id => current_band.id, :id => member.id.to_s, :member => {:name => ''}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, :band_id => current_band.id, :id => member.id.to_s
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, :band_id => current_band.id, :id => member.id.to_s
      response.should redirect_to(band_members_url(current_band))
    end
  end
end
