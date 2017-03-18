class Api::ApiController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # include Authority::Controller
  include CanCan::ControllerAdditions

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  rescue_from CanCan::AccessDenied do |e|
    render json: {errors: e.message}, status: :forbidden
  end

	#--Overwrite devise method
	def current_user
    token = request.headers['Authorization'].presence
    if token
		    @current_user ||= User.find_by_auth_token(token)
    end
	end

	def authenticate_with_token!
		render json: { errors: "Not authenticated"}, status: :unauthorized unless current_user.present?
	end

  def not_found
    render json: {errors: 'Not found' }, status: 404
  end

end
