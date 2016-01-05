require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create_user
  end

  test "renderiza a pagina de login new" do
    get :new
    assert_response :success

    assert_select '.form-horizontal', 1 # verifica se existe um formulario
    assert_select '.control-label', 2 # se tem dois labels
    assert_select '.form-control', 2 # se tem dois inputs
    assert_select '#email', 1 # se tem um elemento com id email
    assert_select '#password', 1 # mesma coisa
  end

  test "requisicao da action create session do usuario" do
    post :create, email: @user.email, password: @user.password # chama o create
    assert_not_nil session[:user_id], 'Usuario nao autenticado' # verifica se criou a sessao
    assert_redirected_to root_url # verifica se redirecionou
  end

  test "destroi sessao do usuario" do
    delete :destroy # chama o destroy
    assert_nil session[:user_id] # verifica se eh nil a sessao
    assert_redirected_to root_url # verifica se redirecionou
  end
end
