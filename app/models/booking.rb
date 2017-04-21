class Booking < ApplicationRecord
  attr_accessor :date
  belongs_to :user
  belongs_to :facility
  has_many :reviews, dependent: :destroy
end
