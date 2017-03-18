class AddIframeFriendlyToDealerships < ActiveRecord::Migration[5.0]
  def change
    add_column :dealerships, :iframeFriendly, :integer, :default => 1

  end
end
