require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test "categoria não pode ser vazio" do
  	category = Category.new
  	assert_not category.save, 'categoria vazio'
  	assert category.errors[:kind].any?
  end
end
