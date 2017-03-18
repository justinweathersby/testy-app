class Api::V1::ServiceRepsController < Api::ApiController
  before_action :authenticate_with_token!


  def index
    @dealership = Dealership.find(params[:dealership_id])
    @service_reps = User.with_role(:service_rep, @dealership)
  end

  def show
    @service_rep = User.find(params[:id])
  end
end
