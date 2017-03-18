class Api::V1::DealershipsController < Api::ApiController
  # load_and_authorize_resource
  # before_action :authenticate_with_token!

  def index
    @dealerships = Dealership.all.order('name ASC')
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  private
    # def dealership_params
    #   params.require(:dealership).permit(:id)
    # end
end
