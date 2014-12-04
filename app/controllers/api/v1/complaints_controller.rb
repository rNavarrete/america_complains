class Api::V1::ComplaintsController < Api::V1::BaseController

  respond_to :json, :xml

  def show
    respond_with Complaint.find(params[:id])
  end

  def index
    respond_with Complaint.all
  end

  def create
    respond_with Complaint.create(complaint_params)
  end

  def update
    respond_with Complaint.update(params[:id], complaint_params)
  end

  def destroy
    respond_with Complaint.destroy(params[:id])
  end

  private

  def complaint_params
    params.require(:complaint).permit(:company)
  end

end