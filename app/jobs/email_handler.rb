class EmailHandler
  @queue = :email

  def self.perform(user_id)
    user = User.find(user_id)
    SignUpMailer.welcome_email(user).deliver
  end
end