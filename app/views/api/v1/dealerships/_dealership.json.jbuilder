json.extract! dealership, :id, :name, :created_at, :updated_at
json.phone dealership.phone
json.location do
  json.street dealership.street
  json.city dealership.city
  json.state dealership.state
  json.zipcode dealership.zipcode
  json.country dealership.country
end
json.primary_color dealership.primary_color
json.new_cars_url dealership.new_cars_url
json.used_cars_url dealership.used_cars_url
json.service_url dealership.service_url
json.specials_url dealership.specials_url
json.service_specials_url dealership.service_specials_url
json.parts_url dealership.parts_url
json.financing_url dealership.financing_url
json.service_email dealership.service_email
json.sales_email dealership.sales_email
json.facebook_url dealership.facebook_url
json.twitter_url dealership.twitter_url
json.logo_url asset_url(dealership.logo.url(:thumb))
json.background_image_url asset_url(dealership.background_image.url(:medium)) if dealership.background_image?
json.iframeFriendly dealership.iframeFriendly
