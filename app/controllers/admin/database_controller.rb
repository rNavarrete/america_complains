class Admin::DatabaseController < Admin::BaseController
  def update
    reader = CsvReader.new("csv/Consumer_Complaints.csv")\
    reader.parse
  end
end
