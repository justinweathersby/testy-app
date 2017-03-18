class PushNotificationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_push_notification, only: [:destroy]

  def index
    # @push_notifications = PushNotification.all
    @push_notifications= PushNotification.all.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @push_notification = PushNotification.new
    @customers = User.where.not('device_token' => nil)
  end

  def edit
  end

  def create
    @push_notification = PushNotification.new(push_notification_params)
    @push_notification.user_id = current_user.id

    respond_to do |format|
      if @push_notification.save
        format.html { redirect_to push_notifications_path, notice: 'Push Notification was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @push_notification.destroy
    respond_to do |format|
      format.html { redirect_to push_notifications_path, notice: 'Push Notification was successfully destroyed.' }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_push_notification
      @push_notification = PushNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def push_notification_params
      params.fetch(:push_notification, {}).permit(:message, :sent_to, :user_id, tokens:[])
    end
end
