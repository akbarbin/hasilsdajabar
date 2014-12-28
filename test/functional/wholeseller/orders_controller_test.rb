require 'test_helper'

class Wholeseller::OrdersControllerTest < ActionController::TestCase
  setup do
    @wholeseller_order = wholeseller_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wholeseller_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wholeseller_order" do
    assert_difference('Wholeseller::Order.count') do
      post :create, wholeseller_order: {  }
    end

    assert_redirected_to wholeseller_order_path(assigns(:wholeseller_order))
  end

  test "should show wholeseller_order" do
    get :show, id: @wholeseller_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wholeseller_order
    assert_response :success
  end

  test "should update wholeseller_order" do
    put :update, id: @wholeseller_order, wholeseller_order: {  }
    assert_redirected_to wholeseller_order_path(assigns(:wholeseller_order))
  end

  test "should destroy wholeseller_order" do
    assert_difference('Wholeseller::Order.count', -1) do
      delete :destroy, id: @wholeseller_order
    end

    assert_redirected_to wholeseller_orders_path
  end
end
