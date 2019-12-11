require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @admin_user = User.create(f_name: 'larry', l_name: 'Long', email: 'long@gm.com',
      user_name: 'larrylong', admin: true,
      password: 'password', password_confirmation: 'password')
  end

  test 'not a unique user_name' do
    user = User.new(f_name: 'Bob', l_name: 'Smith', email: 'smith@gm.com', user_name: 'bobsmith', password: 'password')
    # refute_nil user
    assert user.invalid?, 'Should not be a valid user as a result of exisiting identical user name already existing in the database.'
    assert_equal false, user.save, 'Should not have saved'
    assert_not_nil user.errors[:user_name], 'There should be user name error'
    puts(user.errors.full_messages)
    assert_not_nil user.errors[:user_name]
  end

  test 'first name is too short' do
    user = User.new(f_name: 'B', l_name: 'Smith', email: 'smith@gm.com', user_name: 'bobs', password: 'password')
    # refute_nil user
    assert_equal false, user.valid?, "Should not be a valid new user."
    assert_not_nil user.errors[:f_name], 'First name is not within range'
    puts "#{user.errors[:f_name]}"
  end

  test 'first name is too long' do
    user = User.new(f_name: '123456789012345678901', l_name: 'Smith', email: 'smith@gm.com', user_name: 'bobs', password: 'password')
    # refute_nil user
    assert_not user.valid?, "Should not be a valid new user."
    assert user.errors
    assert user.errors[:f_name], 'First name is not within range'
  end

  test 'number of users created' do
    assert_equal 3, User.count
  end
end
