class Facility < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attachments :photos, maximum: 5
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def booked_dates
    booked_dates = []
    self.bookings.each do |booking|
      start_date = booking.start_date
      end_date = booking.end_date
      if end_date.kind_of?(Date) && start_date.kind_of?(Date) && end_date > start_date
        booked_dates << (start_date..end_date).to_a.map{ |dt| dt.to_s }
      end
    end
    return booked_dates.flatten
  end

end
