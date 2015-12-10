require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user_new = new_user
    @user = create_user
  end

  test "requisicao da action index do User" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "requisicao da action new do User" do
    get :new
    assert_response :success
  end

  test "requisicao da action create do User" do
    
    assert_difference('User.count') do
      post :create, user: { email: @user_new.email, password: @user_new.password, password_confirmation: @user_new.password }
    end
    
    assert_redirected_to user_path(assigns(:user))
  end

  test "requisicao da action show do User" do
    get :show, id: @user
    assert_response :success
  end

  test "requisicao da action edit do User" do
    get :edit, id: @user
    assert_response :success
  end

  test "requisicao da action update do User" do
    patch :update, id: @user, user: { email: @user.email, password: @user.password, password_confirmation: @user.password }
    assert_redirected_to user_path(assigns(:user))
  end

  test "requisicao da action destroy do User" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
