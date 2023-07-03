trip_types = [0, 1]

100.times do
  Trip.create!(
    departure_location: Faker::Address.city,
    arrival_location: Faker::Address.city,
    departure_date: Faker::Date.forward(days: 30),
    arrival_date: Faker::Date.forward(days: 60),
    departure_time: Faker::Time.forward(days: 30, period: :evening),
    arrival_time: Faker::Time.forward(days: 60, period: :evening),
    trip_type: trip_types.sample,
    user: User.first
  )
end
