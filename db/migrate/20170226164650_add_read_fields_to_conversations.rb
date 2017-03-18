class AddReadFieldsToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :recipient_read, :boolean, :default => false
    add_column :conversations, :sender_read, :boolean, :default => false
  end
end
