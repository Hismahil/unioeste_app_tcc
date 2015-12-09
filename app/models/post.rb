class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments #, inverse_of: :post

  accepts_nested_attributes_for :comments, :user

  validates :title, :text, :user, presence: true
end
