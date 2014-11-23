class ComplaintsController < ApplicationController

  def index
    client = GooglePlaces::Client.new("AIzaSyCZ5hhE15pCws_eQivuDxuK__G7_fOAPeM")
    complaints = Complaint.all.limit(10)
    @results = complaints.collect do |complaint|
      client.spots_by_query(complaint[:company])
    end
    @results
    raise "omg"
  end

  def search
    @query = Complaint.search do
      fulltext params[:query]
    end
    @complaints = @query.results
  end
end