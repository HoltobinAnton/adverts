FactoryBot.define do
  factory :user do
    login Faker::Lorem.word
    full_name Faker::Name.name
    birthday Faker::Date.between(2.days.ago, Date.today)
    email { Faker::Internet.email }
    password { Devise.friendly_token.first(8) }
    role
  end
end
