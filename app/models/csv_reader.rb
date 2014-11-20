require 'csv'

class CsvReader
  def initialize(filepath)
    @filepath = filepath
  end

  def parse
    csv_text = File.read(@filepath)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      puts
    end
  end
end