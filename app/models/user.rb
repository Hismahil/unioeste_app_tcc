class User < ActiveRecord::Base
	has_many :posts, inverse_of: :user
	has_many :comments #, inverse_of: :user

	accepts_nested_attributes_for :posts, :comments

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, 
		message: "email invalido" }, uniqueness: { case_sensitive: false }

	# validacoes da imagem
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png" 
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	private
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
