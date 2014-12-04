class SignUpMailer < ActionMailer::Base
  default from: "maximumquota@gmail.com"

  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Thanks for Signing up for America Complains')
  end
end
