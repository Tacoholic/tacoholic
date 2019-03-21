class Restaurant < ApplicationRecord

  has_many :pictures
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :location_changed?

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  def location
    [address].compact.join(", ")
  end

  def location_changed?
      address_changed? 
  end




end


