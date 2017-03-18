# json.(@message, :id, :body, :conversation_id, :user_id)
json.id @message.id
json.body @message.body
json.conversation_id @message.conversation.id
json.user_id @message.user_id
json.partner_name Conversation.find(@message.conversation_id).matched_name(current_user)
json.partner_id Conversation.find(@message.conversation_id).matched_id(current_user)
