json.id review.id
json.restaurant_id review.restaurant_id
json.content review.content
json.taco_points review.taco_points

json.user do 
  json.partial! review.user, partial: 'api/users/user', as: :user
end
