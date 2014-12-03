require_relative "../test_helper"

class CsvReaderTest < ActiveSupport::TestCase

  def test_it_can_parse_a_csv_and_create_complaints
    #test csv file has four records
    CsvReader.new("csv/Consumer_Complaints_Test.csv").parse

    assert_equal 4, Complaint.count
  end
end