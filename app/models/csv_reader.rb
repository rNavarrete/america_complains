require 'csv'

class CsvReader
  def initialize(filepath)
    @filepath = filepath
  end

  def parse
    csv_text = File.read(@filepath)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_h
      begin
        Complaint.create!(product: row["Product"], sub_product: row["Sub-product"], issue: row["Issue"], sub_issue: row["Sub-issue"], state: row["State"], zipcode: row["ZIP code"], date_submitted: row["Date received"], company: row["Company"], consumer_disputed: row["Consumer disputed?"])
      rescue => e
        "Counldn't save wrong state"
      end
    end
  end
end