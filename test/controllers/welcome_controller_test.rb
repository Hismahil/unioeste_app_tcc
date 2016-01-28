require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "verifica se welcome foi renderizado com 6 links no menu" do
    get :index
    assert_response :success

    assert_select 'a', 13 # quantidade de links no menu sem um usuário logado e outros links

  end

  test "verifica posts renderizado no welcome" do
  	@post = create_post
  	get :index
  	assert_response :success

  	assert_select 'h2', 1
  	assert_select 'p', 4	# são três p's para o post e um do objetivos
  	assert_select 'a', 'Ler mais...'
  end

  test "verifica links da categoria" do
  	get :index
  	assert_response :success

  	assert_select 'h4', 'Categorias'
  	assert_select '.list-unstyled' do
  		assert_select 'li', 4
  	end
  end

  test "verifica search box" do
  	get :index
  	assert_response :success

  	assert_select 'h4', 'Pesquisar'
  	assert_select 'input', 1
  end

  test "verifica well com objetivos" do
  	get :index
  	assert_response :success

  	assert_select 'h4', 'Objetivos'
  	assert_select 'p', 1
  end

  test "verifica menu do usuário não logado" do
  	session[:user_id] = nil
  	get :index
  	assert_response :success

  	assert_select 'a', 'Entrar'
  	assert_select 'a', 'Sign up'
  	assert_select 'a', 'log in'
  end

  test "verifica menu do usuário logado" do
  	user = create_user
  	session[:user_id] = user.id
  	get :index
  	assert_response :success

  	assert_select 'a', user.email
  	assert_select 'a', 'Profile'
  	assert_select 'a', 'Log out'
  end

  test "verifica se o link Novo Post com usuário logado" do
    user = create_user
    session[:user_id] = user.id
    get :index
    assert_response :success

    assert_select 'a', 'Novo Post'
  end
end
