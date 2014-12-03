require_relative '../test_helper'

class BusinessesControllerTest < ActionController::TestCase
  attr_reader :business
  def setup
    @business = Business.create(name: "Commonwealth Financial Systems", yelp_id: "windham-professionals-salem")
  end

  def test_it_renders_show_and_serves_the_correct_business
    get(:show, {:id => business.id})

    assert_response :success
    assert_not_nil assigns(:business)
  end
end