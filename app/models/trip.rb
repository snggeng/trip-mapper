class Trip < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :teams
  has_many :users, through: :teams

  # geocoded_by :address
  # after_validation :geocode
end
