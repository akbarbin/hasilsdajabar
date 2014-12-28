require 'test_helper'

class BergainsControllerTest < ActionController::TestCase
  setup do
    @bergain = bergains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bergains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bergain" do
    assert_difference('Bergain.count') do
      post :create, bergain: { bergain_price: @bergain.bergain_price, bergain_status: @bergain.bergain_status, order_id: @bergain.order_id, survey_date: @bergain.survey_date }
    end

    assert_redirected_to bergain_path(assigns(:bergain))
  end

  test "should show bergain" do
    get :show, id: @bergain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bergain
    assert_response :success
  end

  test "should update bergain" do
    put :update, id: @bergain, bergain: { bergain_price: @bergain.bergain_price, bergain_status: @bergain.bergain_status, order_id: @bergain.order_id, survey_date: @bergain.survey_date }
    assert_redirected_to bergain_path(assigns(:bergain))
  end

  test "should destroy bergain" do
    assert_difference('Bergain.count', -1) do
      delete :destroy, id: @bergain
    end

    assert_redirected_to bergains_path
  end
end
