class CreatePushNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :push_notifications do |t|
      t.string :message
      t.string :tokens
      t.string :sent_to

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
