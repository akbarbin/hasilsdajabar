require 'test_helper'

class Seller::PostsControllerTest < ActionController::TestCase
  setup do
    @seller_post = seller_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seller_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller_post" do
    assert_difference('Seller::Post.count') do
      post :create, seller_post: {  }
    end

    assert_redirected_to seller_post_path(assigns(:seller_post))
  end

  test "should show seller_post" do
    get :show, id: @seller_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller_post
    assert_response :success
  end

  test "should update seller_post" do
    put :update, id: @seller_post, seller_post: {  }
    assert_redirected_to seller_post_path(assigns(:seller_post))
  end

  test "should destroy seller_post" do
    assert_difference('Seller::Post.count', -1) do
      delete :destroy, id: @seller_post
    end

    assert_redirected_to seller_posts_path
  end
end
