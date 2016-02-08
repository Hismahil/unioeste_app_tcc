ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def get_user
    users = User.all

    if users.empty?
      users = create_user
    end
    (users.class == Array ? users.first : users)
  end

	def create_post(op = {})
		post = Post.create({ title: 'Post teste', text: 'askllassssquiwioqwoqwiowqioqwioqwioqwqwioqwioqwioqwioqw',
			user: get_user}.merge(op))
    post.categories << categories(:one)
    post.save
    post
	end

  def new_post
    { text: 'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', title: 'Tituloaaaaaasssssss', category_id: categories(:one).id }
  end

  # cria um user para update, destroy, edit, show
	def create_user(op = {})
    User.create({email: generate_email, password: '123456', password_confirmation: '123456'}.merge(op))
  end

  # para o metodo create (email e unico)
  def new_user(op = {})
    User.new({email: generate_email, password: '123456', password_confirmation: '123456'}.merge(op))
  end

  def new_comment
    {email: generate_email, text: 'novo comentario'}
  end
  
    def char
    	v = [ 'a', 'b', 'c', 'd' ]
    	v[rand(v.size)]
    end

    def word(length)
    	s = ""
    	for i in 0..length
    		s.concat char
    	end
    	s
    end

    def generate_email
    	word(6).concat "@gmail.com"
    end
end
