require 'test_helper'

class Seller::BergainsControllerTest < ActionController::TestCase
  setup do
    @seller_bergain = seller_bergains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_bergains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_bergain" do
    assert_difference('Seller::Bergain.count') do
      post :create, seller_bergain: {  }
    end

    assert_redirected_to seller_bergain_path(assigns(:seller_bergain))
  end

  test "should show seller_bergain" do
    get :show, id: @seller_bergain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller_bergain
    assert_response :success
  end

  test "should update seller_bergain" do
    put :update, id: @seller_bergain, seller_bergain: {  }
    assert_redirected_to seller_bergain_path(assigns(:seller_bergain))
  end

  test "should destroy seller_bergain" do
    assert_difference('Seller::Bergain.count', -1) do
      delete :destroy, id: @seller_bergain
    end

    assert_redirected_to seller_bergains_path
  end
end
