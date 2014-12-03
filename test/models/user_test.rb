require 'test_helper'
require 'bcrypt'

class UserTest < ActiveSupport::TestCase
  attr_reader :user

  def setup
    @user = User.create(name: "Rolando", email: "king@gmail.com", username: "Easy-E", password: "password", role: "user")
  end

  def test_it_can_successfully_create_a_user
    assert_equal "king@gmail.com", user.email
  end

  def test_it_returns_nil_for_a_failed_user_authentication
    email = "king@gmail.com"
    password = "wrong_password"
    user.password_salt = BCrypt::Engine.generate_salt
    user.password_hash = BCrypt::Engine.hash_secret(user.password, user.password_salt)

    assert_equal nil, User.authenticate(email, password)
  end

  def test_it_returns_a_correct_user_on_successful_authentication
    email = "king@gmail.com"
    password = "password"
    user.password_salt = BCrypt::Engine.generate_salt
    user.password_hash = BCrypt::Engine.hash_secret(user.password, user.password_salt)

    assert_equal "Rolando", User.authenticate(email, password).name
  end

  def test_it_can_create_a_user_from_twitter_auth_data
                    twitter_hash = {
                                      'provider' => 'twitter',
                                      'info' => {'name' => 'Alice Smith'},
                                      'uid' => 'abc123'
                                    }
    new_user = User.find_or_create_by_auth(twitter_hash)
    assert_equal "Alice Smith", new_user.name
  end

  def test_it_can_tell_if_a_user_is_an_admin
    refute user.admin?

    user.role = "admin"
    assert_equal true, user.admin?
  end


end
