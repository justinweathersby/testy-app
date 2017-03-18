class AddFinancingAndPartsToDealerships < ActiveRecord::Migration[5.0]
  def change
    add_column :dealerships, :financing_url, :string
    add_column :dealerships, :parts_url, :string
  end
end
