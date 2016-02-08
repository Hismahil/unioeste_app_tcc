require 'test_helper'

class CommentFlowsTest < ActionDispatch::IntegrationTest
  
  test "CN - criar um comentario" do
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
    post_id = assigns(:post).id 	# salva o id do post

    https!
    get "/log-out"	# faz log out do usuário
    assert_response :found
    assert_equal "/log-out", path	# verifica root_path
    #assert_select '#notice', "Logged out!" # verifica mensagem

    https!
    get "/posts/#{post_id}"	# acessa o post criado
    assert_response :success

    comment = new_comment	# gera novo comentario

    post_via_redirect "/posts/#{post_id}/comments", comment: comment 	# cria novo comentario
    assert_equal "/posts/#{assigns(:post).id}", path #verifica se esta mostrando o post posts#show

  end

end
