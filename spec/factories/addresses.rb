FactoryBot.define do
  factory :address do
    country Faker::Address.country
    city Faker::Address.city
    address Faker::Address.street_address
    zip Faker::Address.zip
  end
end
