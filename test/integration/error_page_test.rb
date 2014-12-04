require_relative '../test_helper'

class CanLogInTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = SocialMobility::Application
  end

  def test_can_log_in
    visit "/404"
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end