require 'test_helper'
require 'add_yelp_id'


class AddYelpIDTest < ActiveSupport::TestCase
  def test_it_can_add_ids_to_a_business
    businesses = []
    businesses << business1 = Business.create(name: "MNE Services, Inc", address: "122 E 42nd St #380, New York, NY 10168, United States")
    businesses << business2 = Business.create(name: "Monterey Financial Services, Inc.", address: "659 Abrego St #4, Monterey, CA 93940, United States")

    AddYelpID.new(businesses).add_ids
    assert_equal "first-central-services-inc-new-york", business1.yelp_id
    assert_equal "monterey-bay-insurance-services-inc-monterey", business2.yelp_id
  end
end



