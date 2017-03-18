class Api::V1::UsersController < Api::ApiController
  before_action :authenticate_with_token!, only: [:update, :show]
  respond_to :json

  def create
    @user = User.new(sign_up_params)
    if @user.valid?
        @user.generate_auth_token
        @user.save
        render json: {user: @user}, status: 200

    else
      render json: { errors: @user.errors}, status: :bad_request
    end
  end

  def show
    @user = current_user
  end

  def update
  	@user = current_user
  	if @user.update_attributes(update_params)
  		render :update, status: :ok, formats: [:json]
  	else
  		render json: {errors: @user.errors}, status: 422
  	end
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    if @user.present?
      @user.send_reset_password_instructions
      render json: { "result" => "Email with reset instructions has been sent"}, status: :ok
    else
     render json: { "errors" => "Email not found"}, status: 422
    end
  end

  private

  def sign_up_params
    params[:user].permit(:name, :email, :password, :password_confirmation, :dealership_id, :device_token, :device_type)
    # params.permit(:first_name,:last_name,:company_name,:organization_name ,:officer_name,:email, :password, :password_confirmation)
  end

  def update_params
    params.permit(:id, :name, :password, :device_token, :device_type)
  end
end
