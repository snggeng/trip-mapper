class Trip < ApplicationRecord
  has_many :locations
  has_many :teams
  has_many :users, through: :teams
end
