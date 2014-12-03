require_relative '../test_helper'

class ComplaintTest < ActiveSupport::TestCase

  def setup
    Complaint.create(company: "Wells Fargo")
    Complaint.create(company: "Wells Fargo")
    Complaint.create(company: "Citi Bank")
    Complaint.create(company: "Citi Bank")
    Complaint.create(company: "Washington Mutual")

    Business.create(name: "Washington Mutual")
  end

  def test_it_can_group_complaints_by_company_name
    complaints = Complaint.grouped_by_name
    assert_equal ["Wells Fargo", "Citi Bank", "Washington Mutual"], complaints.keys
  end

  def test_it_can_scan_businesses_to_set_its_business_id
    complaint = Complaint.create(company: "Washington Mutual")

    complaint.find_business_id
    assert_equal Business.last.id, complaint.business_id
  end
end