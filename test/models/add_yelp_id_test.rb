require 'test_helper'
require 'add_yelp_id'


class AddYelpIDTest < ActiveSupport::TestCase
  def test_it_can_add_ids_to_a_business
    businesses = []
    businesses << business1 = Business.create(name: "Guild Mortgage", address: "7951 E Maplewood Ave #350, Greenwood Village, CO 80111, United States")
    businesses << business2 = Business.create(name: "Monterey Financial Services, Inc.", address: "659 Abrego St #4, Monterey, CA 93940, United States")

    AddYelpID.new(businesses).add_ids
    assert_equal "guild-mortgage-company-greenwood-village", business1.yelp_id
    assert_equal "monterey-bay-insurance-services-inc-monterey", business2.yelp_id
  end
end



