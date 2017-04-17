class Review < ApplicationRecord
  belongs_to :bookings
  has_many :users, through: :bookings
end
