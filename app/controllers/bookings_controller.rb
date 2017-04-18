class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render 'facilites/show'
    end
  end

  def index

  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :facility_id, :start_date, :end_date)
  end
end
