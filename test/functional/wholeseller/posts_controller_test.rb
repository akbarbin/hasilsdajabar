require 'test_helper'

class Wholeseller::PostsControllerTest < ActionController::TestCase
  setup do
    @wholeseller_post = wholeseller_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wholeseller_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wholeseller_post" do
    assert_difference('Wholeseller::Post.count') do
      post :create, wholeseller_post: {  }
    end

    assert_redirected_to wholeseller_post_path(assigns(:wholeseller_post))
  end

  test "should show wholeseller_post" do
    get :show, id: @wholeseller_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wholeseller_post
    assert_response :success
  end

  test "should update wholeseller_post" do
    put :update, id: @wholeseller_post, wholeseller_post: {  }
    assert_redirected_to wholeseller_post_path(assigns(:wholeseller_post))
  end

  test "should destroy wholeseller_post" do
    assert_difference('Wholeseller::Post.count', -1) do
      delete :destroy, id: @wholeseller_post
    end

    assert_redirected_to wholeseller_posts_path
  end
end
