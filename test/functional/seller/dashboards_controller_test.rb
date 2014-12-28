require 'test_helper'

class Seller::DashboardsControllerTest < ActionController::TestCase
  setup do
    @seller_dashboard = seller_dashboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_dashboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_dashboard" do
    assert_difference('Seller::Dashboard.count') do
      post :create, seller_dashboard: { index: @seller_dashboard.index }
    end

    assert_redirected_to seller_dashboard_path(assigns(:seller_dashboard))
  end

  test "should show seller_dashboard" do
    get :show, id: @seller_dashboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller_dashboard
    assert_response :success
  end

  test "should update seller_dashboard" do
    put :update, id: @seller_dashboard, seller_dashboard: { index: @seller_dashboard.index }
    assert_redirected_to seller_dashboard_path(assigns(:seller_dashboard))
  end

  test "should destroy seller_dashboard" do
    assert_difference('Seller::Dashboard.count', -1) do
      delete :destroy, id: @seller_dashboard
    end

    assert_redirected_to seller_dashboards_path
  end
end
