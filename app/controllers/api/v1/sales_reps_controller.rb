class Api::V1::SalesRepsController < Api::ApiController
  before_action :authenticate_with_token!


  def index
    @dealership = Dealership.find(params[:dealership_id])
    @sales_reps = User.with_role(:sales_rep, @dealership)
  end

  def show
    @sales_rep = User.find(params[:id])
  end

end
