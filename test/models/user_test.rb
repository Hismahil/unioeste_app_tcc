require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nao salva sem o email e a senha" do
  	user = User.new
  	assert_not user.save
  end

  test "nao salva sem o email" do
  	user = User.new
  	user.password = '123456'
  	assert_not user.save
  end

  test "nao salva sem a senha" do
  	user = User.new
  	user.email = 'hismahil@gmail.com'
  	assert_not user.save
  end

end
