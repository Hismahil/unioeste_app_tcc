class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments #, inverse_of: :post
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  attr_accessor :category_id

  accepts_nested_attributes_for :comments, :user, :categories, :categorizations

  validates :title, :text, :user, presence: true
end
