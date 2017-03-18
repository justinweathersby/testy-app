class Api::V1::MessagesController < Api::ApiController
  load_and_authorize_resource
  before_action :authenticate_with_token!
  before_action :find_conversation

  def new
   @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user_id = current_user.id

    if  @message.save
      if current_user.id == @conversation.sender_id
       @conversation.recipient_read = false;
      else
       @conversation.sender_read = false;
      end
      @conversation.save
      render :new, status: :ok, formats: [:json]
    else
      render json: @message.errors, status: :bad_request
    end
  end

  def index
    @messages = @conversation.messages.order(created_at: :asc).last(20)

    if current_user.id == @conversation.sender_id
     @conversation.sender_read = true;
    else
     @conversation.recipient_read = true;
    end
    @conversation.save
  end

  def show
  end

  def destroy
  end

  private
    def find_conversation
      puts "inside find conversatoin"
      if params[:conversation_id]
        @conversation = Conversation.find(params[:conversation_id])
      elsif params[:recipient_id]
        puts "inside elsif recipient_id"
        @conversation = Conversation.between(current_user.id ,params[:recipient_id]).first
        @conversation.inspect
        if @conversation == nil
          p "conversatoin nil in find"
          @conversation = Conversation.create!(:sender_id => current_user.id, :recipient_id => params[:recipient_id])
        end
      else
        render json: {errors: "Must have a conversation_id or a recipient_id."}, status: 422
      end
    end

    def message_params
      # params.permit(:user_id, :body)
      params.require(:message).permit(:user_id,:body, :conversation_id, :recipient_id)
    end
end
