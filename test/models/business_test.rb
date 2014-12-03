require_relative "../test_helper"

class BusinessTest < ActiveSupport::TestCase
  def test_it_validates_for_a_unique_business_name
    2.times do
      Business.create(name: "Doggy Heaven")
    end

    assert_equal 1, Business.count
  end
end
