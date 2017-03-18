class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    # -- This is all mostly for Super Admin Dashboard
    @moderators = User.with_role(:moderator, :any)
    @sales_reps = User.with_role(:sales_rep, :any)
    @service_reps = User.with_role(:service_rep, :any)
    @customers = User.with_role(:customer)

    if user_signed_in? and current_user.has_role?(:moderator, :any)
      @dealership = Dealership.with_role(:moderator, current_user).first
    end
  end
end
