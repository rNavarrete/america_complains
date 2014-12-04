class SignUpMailer < ActionMailer::Base
  default from: "maximumquota@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for Signing up for America Complains')
  end
end
