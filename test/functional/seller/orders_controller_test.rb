require 'test_helper'

class Seller::OrdersControllerTest < ActionController::TestCase
  setup do
    @seller_order = seller_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_order" do
    assert_difference('Seller::Order.count') do
      post :create, seller_order: {  }
    end

    assert_redirected_to seller_order_path(assigns(:seller_order))
  end

  test "should show seller_order" do
    get :show, id: @seller_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller_order
    assert_response :success
  end

  test "should update seller_order" do
    put :update, id: @seller_order, seller_order: {  }
    assert_redirected_to seller_order_path(assigns(:seller_order))
  end

  test "should destroy seller_order" do
    assert_difference('Seller::Order.count', -1) do
      delete :destroy, id: @seller_order
    end

    assert_redirected_to seller_orders_path
  end
end
