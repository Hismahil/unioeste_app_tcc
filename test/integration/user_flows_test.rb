require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  
  test "CN - criar usuario" do 
  	
  	https!
  	get "/sign-up"
  	assert_response :success

  	post_via_redirect "/users", user: {email: generate_email, password: '123456', password_confirmation: '123456'}
    assert_equal '/', path #verifica se redireciono para welcome
    assert_select '#notice', "Signed up!" #verifica se aparece a mensagem

  end

  test "CN - visualizar usuario que não existe" do 
  	
  	https!
  	get "/users/23456" # usuario que não existe
  	assert_response :found # redirect

  	https!
  	get "/"
  	assert_response :success

    assert_select '#notice', "You cannot show other user" # verifica se aparece a mensagem

  end

  test "CN - tentar visualizar usuario sem permissão" do 
  	user_1 = create_user
  	user_2 = create_user

  	https!
  	get "/users/2" # usuario que não existe
  	assert_response :found # redirect

  	https!
  	get "/"
  	assert_response :success

    assert_select '#notice', "You cannot show other user" # verifica se aparece a mensagem

  end

  test "CN - tentar visualizar usuario sem permissão estando logado" do 
  	user_1 = create_user
  	user_2 = create_user
  	
  	# login 
    https! #https seguro
    get "/log-in" #chama a tela de login (sessions#new)
    assert_response :success
 
    post_via_redirect "/sessions", email: user_1.email, password: user_1.password #sessions#create
    assert_equal '/', path #verifica se redireciono para welcome
    assert_select 'a', user_1.email #verifica se aparece o nome do usuário no canto superior direito
    assert_not_nil session[:user_id]

  	https!
  	get "/users/2" # usuario que não existe
  	assert_response :found # redirect

  	https!
  	get "/"
  	assert_response :success

    assert_select '#notice', "You cannot show other user" # verifica se aparece a mensagem

  end
end
