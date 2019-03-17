json.name restaurant.name
json.id restaurant.id
json.address restaurant.address
json.latitude restaurant.latitude
json.longitude restaurant.longitude
json.phone_number restaurant.phone_number
json.website_url restaurant.website_url
json.menu_url restaurant.menu_url
json.hours restaurant.hours

json.reviews do 
  json.array! restaurant.reviews, partial: 'api/reviews/review', as: :review
end

json.pictures do
  json.array! restaurant.pictures, partial: 'api/pictures/picture', as: :picture 
end

