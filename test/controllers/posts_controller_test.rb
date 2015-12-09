require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @users = User.all

    if @users.empty?
      @users = User.create email: 'hismahil@gmail.com', password: '123456'
    end

    @post = Post.new title: 'Teste', text: 'texto', user_id: (@users.class == Array ? @users[0].id : @users.id)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { text: @post.text, title: @post.title, user_id: @post.user_id }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { text: @post.text, title: @post.title, user_id: @post.user_id }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
