require 'test_helper'

class JAppsControllerTest < ActionController::TestCase
  setup do
    @j_app = j_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:j_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create j_app" do
    assert_difference('JApp.count') do
      post :create, j_app: {  }
    end

    assert_redirected_to j_app_path(assigns(:j_app))
  end

  test "should show j_app" do
    get :show, id: @j_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @j_app
    assert_response :success
  end

  test "should update j_app" do
    put :update, id: @j_app, j_app: {  }
    assert_redirected_to j_app_path(assigns(:j_app))
  end

  test "should destroy j_app" do
    assert_difference('JApp.count', -1) do
      delete :destroy, id: @j_app
    end

    assert_redirected_to j_apps_path
  end
end
