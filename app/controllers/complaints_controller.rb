class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def search
    @query = Complaint.search do
      fulltext params[:query]
    end
    @complaints = @query.results
  end
end