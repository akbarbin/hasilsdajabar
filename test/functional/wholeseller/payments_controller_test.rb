require 'test_helper'

class Wholeseller::PaymentsControllerTest < ActionController::TestCase
  setup do
    @wholeseller_payment = wholeseller_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wholeseller_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wholeseller_payment" do
    assert_difference('Wholeseller::Payment.count') do
      post :create, wholeseller_payment: {  }
    end

    assert_redirected_to wholeseller_payment_path(assigns(:wholeseller_payment))
  end

  test "should show wholeseller_payment" do
    get :show, id: @wholeseller_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wholeseller_payment
    assert_response :success
  end

  test "should update wholeseller_payment" do
    put :update, id: @wholeseller_payment, wholeseller_payment: {  }
    assert_redirected_to wholeseller_payment_path(assigns(:wholeseller_payment))
  end

  test "should destroy wholeseller_payment" do
    assert_difference('Wholeseller::Payment.count', -1) do
      delete :destroy, id: @wholeseller_payment
    end

    assert_redirected_to wholeseller_payments_path
  end
end
