class AddBelongsToDealership < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :dealership, foreign_key: true
  end
end
