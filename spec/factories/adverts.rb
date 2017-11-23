FactoryBot.define do
  factory :advert do
    user
    description Faker::Lorem.words
  end
end
