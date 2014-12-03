require_relative '../test_helper'

class UsersControllerTest < ActionController::TestCase

 def test_it_successfully_renders_new_page
  get :new

  assert_response :success
  assert_not_nil assigns(:user)
 end

 def test_it_can_create_a_user
  user_params = { :user => {email: "king@royal.com", password: "password", name: "Rolando"}}
  get(:create, user_params)
  assert_equal "Rolando", User.last.name
 end


end
