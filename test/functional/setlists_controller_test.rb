require 'test_helper'

class SetlistsControllerTest < ActionController::TestCase
  setup do
    @setlist = setlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setlist" do
    assert_difference('Setlist.count') do
      post :create, setlist: @setlist.attributes
    end

    assert_redirected_to setlist_path(assigns(:setlist))
  end

  test "should show setlist" do
    get :show, id: @setlist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setlist.to_param
    assert_response :success
  end

  test "should update setlist" do
    put :update, id: @setlist.to_param, setlist: @setlist.attributes
    assert_redirected_to setlist_path(assigns(:setlist))
  end

  test "should destroy setlist" do
    assert_difference('Setlist.count', -1) do
      delete :destroy, id: @setlist.to_param
    end

    assert_redirected_to setlists_path
  end
end
