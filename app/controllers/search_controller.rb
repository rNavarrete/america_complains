class SearchController < ApplicationController

  def search_for
    @query = Business.search do
      fulltext params[:query]
    end
    @search_results = @query.results
  end
end