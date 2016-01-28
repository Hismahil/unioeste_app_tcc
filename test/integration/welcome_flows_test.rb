require 'test_helper'

class WelcomeFlowsTest < ActionDispatch::IntegrationTest
  
  test "verifica se renderiza o welcome" do 
  	
  	https!						# https seguro
  	get '/'						# root_url welcome#index
  	assert_response :success

  end
end
