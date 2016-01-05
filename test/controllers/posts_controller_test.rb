require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = create_post
    @user = @post.user
    @update = { text: 'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', title: 'Tituloaaaaaasssssss'}
  end

  test "requisicao da action index do Post" do
    get :index
    assert_response :found
    assert_redirected_to root_url
  end

  test "requisicao da action new do Post" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "requisicao da action create do Post" do
    session[:user_id] = @user.id
    assert_difference('Post.count') do
      post :create, post: @update
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "requisicao da action show do Post" do
    session[:user_id] = @user.id
    get :show, id: @post
    assert_response :success
  end

  test "requisicao da action edit do Post" do
    session[:user_id] = @user.id
    get :edit, id: @post
    assert_response :success
  end

  test "requisicao da action update do Post" do
    session[:user_id] = @user.id
    patch :update, id: @post, post: @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "requisicao da action destroy do Post" do
    session[:user_id] = @user.id

    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to root_url
  end
end
