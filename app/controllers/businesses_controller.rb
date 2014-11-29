require 'yelp'
class BusinessesController < ApplicationController

  def show
  @business = Business.find(params[:id])
  coordinates = { latitude: @business.lat, longitude: @business.lng }
  params = {term: @business.name, limit: 1, category_filter: 'financialservices'}
  @results = Yelp.client.search(@business.address[-33..-22], params)
  raise "omg"
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :lat, :lng)
  end
end