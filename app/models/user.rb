class User < ApplicationRecord
  has_many :pictures
  has_many :reviews
end
