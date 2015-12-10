require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nao cria usuario sem informacoes" do
    user = create_user email: nil, password: nil
    assert_not user.valid?, "O usuario nao pode ser criado"
  end

  test "nao salva sem o email" do
    user = create_user email: nil
    assert_not_nil user.errors.messages[:email], "O email deve ser informado"
    assert_not user.save
  end

  test "nao salva sem a senha" do
    user = create_user password: nil
    assert_not_nil user.errors.messages[:password], "A senha deve ser informado"
    assert_not user.save
  end

  test "nao cria o mesmo usuario" do
    user = create_user email: 'hismahil@gmail.com', password: '123456'
    assert user.save

    user = create_user email: 'hismahil@gmail.com', password: '123456'
    assert_not user.save
  end

end
