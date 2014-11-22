class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def search
  parameters = { term: params[:query], limit: 16 }
    render json: Yelp.client.search('Denver', parameters)



    @query = Complaint.search do
      fulltext params[:query]
    end
    @complaints = @query.results
  end
end