require 'test_helper'

class Admin::PaymentsControllerTest < ActionController::TestCase
  setup do
    @admin_payment = admin_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_payment" do
    assert_difference('Admin::Payment.count') do
      post :create, admin_payment: {  }
    end

    assert_redirected_to admin_payment_path(assigns(:admin_payment))
  end

  test "should show admin_payment" do
    get :show, id: @admin_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_payment
    assert_response :success
  end

  test "should update admin_payment" do
    put :update, id: @admin_payment, admin_payment: {  }
    assert_redirected_to admin_payment_path(assigns(:admin_payment))
  end

  test "should destroy admin_payment" do
    assert_difference('Admin::Payment.count', -1) do
      delete :destroy, id: @admin_payment
    end

    assert_redirected_to admin_payments_path
  end
end
