module FacilitiesHelper
  def photo_from_facility(facility)
   if facility.photos.count > 0
     facility.photos.first.path
   else
     "http://www.thewaterfrontbrewery.com/wp-content/uploads/2016/05/thebrewery.jpg"
   end
 end
end
