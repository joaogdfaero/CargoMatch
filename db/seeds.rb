trip_types = ['Solicitada', 'Oferecida']

100.times do
  user = User.create!(
    name: Faker::Name.name,
    cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    driver: [true, false].sample,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6)
  )

  Trip.create!(
    departure_location: Faker::Address.city,
    arrival_location: Faker::Address.city,
    departure_date: Faker::Date.forward(days: 30),
    arrival_date: Faker::Date.forward(days: 60),
    departure_time: Faker::Time.forward(days: 30, period: :evening),
    arrival_time: Faker::Time.forward(days: 60, period: :evening),
    trip_type: trip_types.sample,
    user: user
  )
end




