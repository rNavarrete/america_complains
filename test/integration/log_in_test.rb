require_relative '../test_helper'

class CanLogInTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = SocialMobility::Application
    User.create(password: "password", email: "king@gmail.com")
  end

  def test_can_log_in
    visit '/'
    within(:css, ".navbar") do
      fill_in('email', :with => 'king@gmail.com')
      fill_in('password', :with => 'password')
      click_button('Sign in')
      save_and_open_page
    end
    assert page.has_content?("You have been logged in."), "page should have a welcome message"
  end
end