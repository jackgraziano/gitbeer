class Facility < ApplicationRecord
  belongs_to :user
  has_many :bookings

  def booked_dates
    booked_dates = []
    self.bookings.each do |booking|
      start_date = booking.start_date
      end_date = booking.end_date
      booked_dates << (start_date..end_date).to_a.map{ |dt| dt.to_s }
    end
    return booked_dates.flatten
  end
end
