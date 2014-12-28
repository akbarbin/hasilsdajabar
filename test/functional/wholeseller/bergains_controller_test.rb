require 'test_helper'

class Wholeseller::BergainsControllerTest < ActionController::TestCase
  setup do
    @wholeseller_bergain = wholeseller_bergains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wholeseller_bergains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wholeseller_bergain" do
    assert_difference('Wholeseller::Bergain.count') do
      post :create, wholeseller_bergain: {  }
    end

    assert_redirected_to wholeseller_bergain_path(assigns(:wholeseller_bergain))
  end

  test "should show wholeseller_bergain" do
    get :show, id: @wholeseller_bergain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wholeseller_bergain
    assert_response :success
  end

  test "should update wholeseller_bergain" do
    put :update, id: @wholeseller_bergain, wholeseller_bergain: {  }
    assert_redirected_to wholeseller_bergain_path(assigns(:wholeseller_bergain))
  end

  test "should destroy wholeseller_bergain" do
    assert_difference('Wholeseller::Bergain.count', -1) do
      delete :destroy, id: @wholeseller_bergain
    end

    assert_redirected_to wholeseller_bergains_path
  end
end
