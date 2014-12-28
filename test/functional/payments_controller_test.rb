require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { bank_transfer_to: @payment.bank_transfer_to, date_payment: @payment.date_payment, method_payment: @payment.method_payment, name_owner_account: @payment.name_owner_account, no_rek: @payment.no_rek, no_transfer_to: @payment.no_transfer_to, order_number: @payment.order_number, status_payment: @payment.status_payment }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    put :update, id: @payment, payment: { bank_transfer_to: @payment.bank_transfer_to, date_payment: @payment.date_payment, method_payment: @payment.method_payment, name_owner_account: @payment.name_owner_account, no_rek: @payment.no_rek, no_transfer_to: @payment.no_transfer_to, order_number: @payment.order_number, status_payment: @payment.status_payment }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
