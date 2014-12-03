require_relative "../test_helper"

class BusinessUpdaterTest < ActiveSupport::TestCase

  def setup
    10.times do |i|
      company = ["Wells Fargo", "HSBC", "Bank of America", "Equifax"].sample
      Complaint.create(company: company)
    end
    @grouped = Complaint.grouped_by_name
  end

  def test_it_creates_new_business_entries_from_complaints
    businesses = BusinessUpdater.new(@grouped).update
    refute_equal 0, Business.count
  end
end