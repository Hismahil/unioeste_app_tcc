require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  setup do
  	@post = create_post
  	@update = {email: 'h@gmail.com', text: 'aksalsalslksalksalkqoiwqoiwqiowqoiwq'}
  	@comment = Comment.create email: 'u@gmail.com', text: 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', post: @post
  end

  test "cria comentario" do
	post :create, post_id: @post.id, comment: @update
	assert_redirected_to post_path(assigns(:post))
  end

  test "destroi comentario" do
  	delete :destroy, post_id: @post.id, id: @comment
  	assert_redirected_to post_path(assigns(:post))
  end
end
