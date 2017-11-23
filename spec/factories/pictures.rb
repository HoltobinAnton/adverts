FactoryBot.define do
  factory :picture do
    image do
      File.open(File.join(Rails.root, 'spec', 'support', 'images', 'test.jpeg'))
    end
    association :imageable, factory: :advert
  end
end
