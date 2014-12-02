class ComplaintsController < ApplicationController

  def index
    @results = Complaint.test_five
    gon.businesses = Business.all
    @businesses = Business.all
  end
end