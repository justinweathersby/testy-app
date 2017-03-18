class AddServiceSpecialsToDealerships < ActiveRecord::Migration[5.0]
  def change
    add_column :dealerships, :service_specials_url, :string
  end
end
