require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should get index" do
  	@post = create_post
    get :index
    assert_response :success
  end

end
