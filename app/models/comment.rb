class Comment < ActiveRecord::Base
  belongs_to :post

  accepts_nested_attributes_for :post

end
