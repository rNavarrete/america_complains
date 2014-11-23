class Admin::DatabaseController < Admin::BaseController
  def update_data
    reader = CsvReader.new("csv/Consumer_Complaints.csv")
    reader.parse
    redirect_to root_path
  end

  def update_businesses
    complaints = Complaint.test_five
    BusinessUpdater.new(complaints).update
    flash[:notice] = "Business listings successfully updated."
    redirect_to root_path

  end
end