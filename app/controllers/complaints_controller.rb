class ComplaintsController < ApplicationController

  def index
    gon.businesses = Business.all
    @businesses = Business.all
  end
end