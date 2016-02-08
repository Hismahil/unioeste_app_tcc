require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest

  test "CN - criar um post" do
  	user = create_user
    
    # login 
    https! #https seguro
    get "/log-in" #chama a tela de login (sessions#new)
    assert_response :success
 
    post_via_redirect "/sessions", email: user.email, password: user.password #sessions#create
    assert_equal '/', path #verifica se redireciono para welcome
    assert_select 'a', user.email #verifica se aparece o nome do usuário no canto superior direito

    https!
    get "/posts/new" #chama posts#new
    assert_response :success
    
    # cria o post
    post_via_redirect "/posts", post: new_post
    assert_equal "/posts/#{assigns(:post).id}", path #verifica se esta mostrando o post posts#show

  end

  test "CN - criar um post sem estar logado" do
    
    https!
    get "/posts/new" #chama posts#new
    assert_response :found # redirect
    
    https!
    get '/'
    assert_response :success
    assert_select '#notice', "You cannot create post without be user" # mensagem

  end

  test "CN - visualizar um post que não existe" do
    
    https!
    get "/posts/23456" #chama posts#new
    assert_response :found # redirect
    
    https!
    get '/'
    assert_response :success

    assert_select '#notice', 'Post not found!' # mensagem

  end

  test "CN - post por categoria" do
 
    post = create_post # cria um post para exibir

    https!
    get "/posts?category=#{categories(:one).id}" # chama posts#index filtrando pela categoria
    assert_response :success

    assert_select 'h2', post.title # verifica o titulo do post
    assert_select 'p', 4 # outros elementos
  end
end
