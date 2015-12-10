require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create_post
  end

  test "requisicao da action index do Post" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "requisicao da action new do Post" do
    get :new
    assert_response :success
  end

  test "requisicao da action create do Post" do
    assert_difference('Post.count') do
      post :create, post: { text: @post.text, title: @post.title, user_id: @post.user.id }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "requisicao da action show do Post" do
    get :show, id: @post
    assert_response :success
  end

  test "requisicao da action edit do Post" do
    get :edit, id: @post
    assert_response :success
  end

  test "requisicao da action update do Post" do
    patch :update, id: @post, post: { text: @post.text, title: @post.title, user_id: @post.user.id }
    assert_redirected_to post_path(assigns(:post))
  end

  test "requisicao da action destroy do Post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
