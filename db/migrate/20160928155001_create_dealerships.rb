class CreateDealerships < ActiveRecord::Migration[5.0]
  def up
    create_table :dealerships do |t|
      t.string :name
      t.string :phone
      t.string :primary_color

      t.string :new_cars_url
      t.string :used_cars_url
      t.string :service_url

      t.string :sales_email
      t.string :service_email

      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.attachment :logo
      t.attachment :background_image
      t.timestamps
    end
  end

  def down
    drop_table :dealerships
  end
end
