require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should get index" do
  	@post = create_post
    get :index
    assert_response :success

    assert_select '.col-sm-10', 1
    assert_select '.panel', 1
  end

end
