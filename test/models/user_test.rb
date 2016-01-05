require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nao cria usuario sem informacoes" do
    user = create_user email: nil, password: nil, password_confirmation: nil
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert_not user.errors[:password_confirmation].any?
    assert_not user.valid?, "O usuario nao pode ser criado"
  end

  test "a senha e a confirmacao devem corresponder" do
    user = create_user password: '123456', password_confirmation: '789010'
    assert user.errors[:password_confirmation].any?
  end

  test "verifica a autenticacao" do
    user = create_user email: 'hismahilepd@gmail.com'

    assert_nil User.authenticate('hismahil@gmail.com', '123')
    assert User.authenticate('hismahilepd@gmail.com', '123456')
  end

  test "nao cria o mesmo usuario" do
    user = create_user email: 'hismahil@gmail.com'
    assert user.save

    user = create_user email: 'hismahil@gmail.com'
    assert_not user.save
  end

end
