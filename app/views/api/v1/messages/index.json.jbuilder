json.conversation_id @conversation.id
json.messages @messages do |msg|
      json.sender_id msg.user_id
      json.sender_name User.find(msg.user_id).name
      json.body msg.body
      json.read msg.read
end
