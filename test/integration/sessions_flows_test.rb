require 'test_helper'

class SessionsFlowsTest < ActionDispatch::IntegrationTest
  
  test "CN - login via browse site" do
  	user = create_user
    
    # login 
    https! #https seguro
    get "/log-in" #chama a tela de login (sessions#new)
    assert_response :success
 
    post_via_redirect "/sessions", email: user.email, password: user.password #sessions#create
    assert_equal '/', path #verifica se redireciono para welcome
    assert_select 'a', user.email #verifica se aparece o nome do usuário no canto superior direito
  end
end
