json.conversations @conversations do |convo|
      json.conversation_id convo.id
      json.sender_name convo.matched_name(current_user)
      json.sender_id convo.matched_id(current_user)
      json.sender_image convo.matched_image(current_user)
      json.sender_dealership convo.matched_dealership(current_user).name if convo.matched_dealership(current_user).present?
      json.sender_role User.find(convo.matched_id(current_user)).has_role?(:sales_rep, convo.matched_dealership(current_user)) ?  "Sales Rep" : "Service Rep"
      json.recipient_read current_user.id == convo.sender_id ? convo.sender_read : convo.recipient_read
      json.last_message do
        json.body convo.messages.last.body
        json.sender_name User.find(convo.messages.last.user_id).name
        json.created_at convo.format_last_message_date
      end
end
