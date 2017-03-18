class AddSpecialsToDealerships < ActiveRecord::Migration[5.0]
  def change
    add_column :dealerships, :specials_url, :string
  end
end
