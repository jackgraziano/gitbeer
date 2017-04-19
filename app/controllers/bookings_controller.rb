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
    @my_own_bookings = User.find(current_user).my_own_bookings
    @bookings_in_my_facilities = User.find(current_user).bookings_in_my_facilities
  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :facility_id, :start_date, :end_date)
  end
end
