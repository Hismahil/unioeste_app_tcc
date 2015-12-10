require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = get_user
  end

  test "renderiza a pagina de login new" do
    get :new
    assert_response :success
  end

  test "requisicao da action create session do usuario" do
    post :create, params: { email: @user.email, password: @user.password }
    #assert_redirected_to root_path
    assert_response :success
  end

end
