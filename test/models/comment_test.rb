require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nao precisa de comentario" do
  	comment = Comment.new
  	assert comment.save
  end

end
