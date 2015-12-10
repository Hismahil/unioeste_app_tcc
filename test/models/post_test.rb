require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  test "nao salva o post sem informacoes" do
    post = create_post title: nil, text: nil, user: nil
    assert_not post.save
  end

  test "nao salva sem o titulo" do
    post = create_post title: nil
    assert_not post.save
  end

  test "nao salva sem o texto do post" do
    post = create_post text: nil
    assert_not post.save
  end

end
