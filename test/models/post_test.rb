require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
  	@users = User.all

  	if @users.empty?
  		@users = User.create email: 'hismahil@gmail.com', password: '123456'
  	end
  end

  test "nao salva sem o titulo" do
  	post = Post.new
  	post.user = (@users.class == Array ? @users[0] : @users)
  	post.text = "asklsalksalksalksalksaklsalksakl"
  	assert_not post.save
  end

  test "nao salva sem o texto do post" do
  	post = Post.new
  	post.user = (@users.class == Array ? @users[0] : @users)
  	post.title = "Discursos da Dilma"
  	assert_not post.save
  end

end
