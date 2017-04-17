class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :reviews
end
