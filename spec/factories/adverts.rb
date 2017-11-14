FactoryBot.define do
  factory :advert do
    user
    login Faker::Lorem.words
  end
end
