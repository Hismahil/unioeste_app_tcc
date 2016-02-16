require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  test "nao salva o post sem informacoes" do
    post = create_post title: nil, text: nil, user: nil
    assert post.errors[:title].any?
    assert post.errors[:text].any?
    assert post.errors[:user].any?
    assert post.valid?
  end

end
