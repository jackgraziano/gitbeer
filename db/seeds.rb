# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  user = User.new
  user.email = Faker::Internet.email
  pass = Faker::Internet.password
  user.password = pass
  user.password_confirmation = pass
  user.save
end

10.times do
  facility = Facility.new
  facility.description = Faker::Company.catch_phrase
  facility.equipments_description = Faker::Hipster.sentences.join(" ")
  facility.producing_capability = ((10..100).to_a.sample)*1000
  facility.address = Faker::Address.street_address
  facility.user_id = (1..User.count).to_a.sample
  facility.save
end

8.times do
  booking = Booking.new
  booking.user_id = (1..User.count).to_a.sample
  booking.facility_id = (1..Facility.count).to_a.sample
  booking.start_date = Faker::Date.forward(20)
  booking.end_date = booking.start_date + (1..7).to_a.sample
  booking.save
end

