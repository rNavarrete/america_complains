class ComplaintsController < ApplicationController

  def index
    @results = Complaint.test_five
    gon.businesses = Business.all
  end

  def search
    @query = Complaint.search do
      fulltext params[:query]
    end
    @complaints = @query.results
  end
end