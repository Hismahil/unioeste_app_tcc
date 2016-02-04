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
end
