class Category < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :posts, through: :categorizations

	accepts_nested_attributes_for :posts, :categorizations

	validates :kind, presence: true
end
