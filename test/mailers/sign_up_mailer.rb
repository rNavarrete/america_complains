require_relative "../test_helper"

class SignUpMailerTest < ActionMailer::TestCase

 test "invite" do
    user = User.create(email: "king@gmail.com", username: "Rolando")
    email = SignUpMailer.welcome_email(user).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ["maximumquota@gmail.com"], email.from
    assert_equal ['king@gmail.com'], email.to
    assert_equal 'Thanks for Signing up for America Complains', email.subject
  end
end