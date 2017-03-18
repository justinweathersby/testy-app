class AddSocialMediaToDealerships < ActiveRecord::Migration[5.0]
  def change
    add_column :dealerships, :facebook_url, :string
    add_column :dealerships, :twitter_url, :string
  end
end
