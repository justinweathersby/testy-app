class Api::V1::ConversationsController < Api::ApiController
 load_and_authorize_resource
 before_action :authenticate_with_token!

def index
 @conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id).order(updated_at: :desc)
end

def create
  if Conversation.between(current_user.id ,params[:recipient_id]).present?
     @conversation = Conversation.between(current_user.id, params[:recipient_id])
  else
     @conversation = Conversation.create!(current_user.id, params[:recipient_id])
     puts @conversation.inspect
  end

  # ---The between method checks to see if a conversation between these 2 users
  # ---exists…only if one does not already exist is the conversation created.

end

private
 def conversation_params
  params.permit(:sender_id, :recipient_id)
 end

end
