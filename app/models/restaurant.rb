class Restaurant < ApplicationRecord

  has_many :pictures, through: :users
  has_many :reviews, through: :users
end
