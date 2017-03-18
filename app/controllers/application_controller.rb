class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # check_authorization //--Lock Down with CanCanCan

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
