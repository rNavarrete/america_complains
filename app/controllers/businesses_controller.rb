require 'yelp'
class BusinessesController < ApplicationController

  def show
    @business = Business.find(params[:id])

    unless @business.yelp_id.nil?
      begin
        @result = Yelp.client.business(@business.yelp_id)
      rescue => e
      end
    end
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :lat, :lng)
  end
end