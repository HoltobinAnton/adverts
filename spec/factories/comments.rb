FactoryBot.define do
  factory :comment do
    description Faker::Lorem.words
    user
    advert
  end
end
