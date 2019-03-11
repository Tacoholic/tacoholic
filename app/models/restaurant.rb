class Restaurant < ApplicationRecord

  has_many :pictures, through: :users
  has_many :reviews, through: :users

  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode


  

end
