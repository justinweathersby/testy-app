json.id @user.id
json.email @user.email
json.name @user.name
json.auth_token @user.auth_token
json.dealership_id @user.dealership_id
json.created_at @user.created_at
json.isCustomer @user.has_role?(:customer) ? true : false
json.roles @user.roles do |role|
  json.id role.id
  json.name role.name
  json.dealership_id role.resource_id if role.resource_id.present?
  json.dealership Dealership.find(role.resource_id).name if role.resource_id.present?
end

# json.partner_name Conversation.find(@message.conversation_id).matched_name(current_user)
# json.partner_id Conversation.find(@message.conversation_id).matched_id(current_user)
