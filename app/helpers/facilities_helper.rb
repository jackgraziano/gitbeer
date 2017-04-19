module FacilitiesHelper

  def photo_from_facility(facility)
   if facility.photos.count > 0
     facility.photos.first.path
   else
     "http://www.thewaterfrontbrewery.com/wp-content/uploads/2016/05/thebrewery.jpg"
   end
 end

  def photo_from_booking(booking)
    if booking.facility.photos.count > 0
      booking.facility.photos.first.path
    else
      "https://www.drinkpreneur.com/wp-content/uploads/2017/04/drinkpreneur_2016-01-26-1453821995-8643361-beermain.jpg"
    end
  end

end
