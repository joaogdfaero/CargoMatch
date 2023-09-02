FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } # You can use a secure password here
      name { Faker::Name.name } # Provide a random name
      cpf { Faker::IDNumber.brazilian_citizen_number } # Generate a valid CPF
      driver { [true, false].sample } # Randomly set driver to true or false
    end
  end