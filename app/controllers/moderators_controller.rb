class ModeratorsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource :class => false

  def new
  end

  def create
    @user = User.new(sign_up_params)
    @dealership = Dealership.find(params[:dealership_id])
    if @user.valid? and @dealership.present?
        @user.add_role :moderator, @dealership
        @user.dealership_id = @dealership.id
        if @user.save
          redirect_to root_url, notice: 'Moderator was successfully created.'
        else
          render :new, notice: @user.errors
        end
    else
      render :new, notice: @user.errors
    end
  end

  # def show
  #   @user = current_user
  # end

  def update
  	@user = current_user
  	if @user.update_attributes(update_params)
  		render :update, status: :ok, formats: [:json]
      # redirect_to root_url, notice: 'Moderator was successfully created.'
  	else
  		format.html { render :edit }
  	end
  end

  # def reset_password
  #   @user = User.find_by_email(params[:user][:email])
  #   if @user.present?
  #     # @user.send_reset_password_instructions
  #     # render json: { "result" => "Email with reset instructions has been sent"}, status: :ok
  #   else
  #    render json: { "errors" => "Email not found"}, status: 422
  #   end
  # end

  private

  def sign_up_params
    params[:moderator].permit(:name, :email, :password, :password_confirmation, :dealership_id, :image)
    # params.permit(:first_name,:last_name,:company_name,:organization_name ,:officer_name,:email, :password, :password_confirmation)
  end

  def update_params
    params.permit(:name, :email, :password, :password_confirmation, :dealership_id, :image)
  end
end
