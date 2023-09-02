FactoryBot.define do
    factory :trip do
      departure_location { Faker::Address.city }
      arrival_location { Faker::Address.city }
      departure_date { Faker::Date.forward(days: 10) }
      arrival_date { Faker::Date.forward(days: 20) }
      departure_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 10.days) }
      arrival_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 20.days) }
      trip_type { 'Solicitada' } 
      user
    end
  end
  