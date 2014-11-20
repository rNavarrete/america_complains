class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  validates :password, confirmation: true
  validates :password_confirmation, presence: true



  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.find_or_create_by_auth(auth_data)
    user = User.where(provider: auth_data[:provider], uid: auth_data[:uid]).first_or_create
    if user.name != auth_data["info"]["name"]
      user.name = auth_data["info"]["name"]
      user.save
    end
    user
  end

  def admin?
    self.role == "admin"
  end
end
