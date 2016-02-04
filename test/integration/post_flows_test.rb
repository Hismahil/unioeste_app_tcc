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
    post_via_redirect "/posts", post: {title: 'Post teste', text: 'askllassssquiwioqwoqwiowqioqwioqwioqwqwioqwioqwioqwioqwwqiooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'}
    assert_equal "/posts/#{assigns(:post).id}", path #verifica se esta mostrando o post posts#show

  end
end
