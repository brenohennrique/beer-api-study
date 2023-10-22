FactoryBot.define do
  factory :brand do
    name { Faker::Beer.brand }
  end
end
