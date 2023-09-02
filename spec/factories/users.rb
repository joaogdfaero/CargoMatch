FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } 
      name { Faker::Name.name } 
      cpf { Faker::IDNumber.brazilian_citizen_number } 
      driver { [true, false].sample } 
    end
  end