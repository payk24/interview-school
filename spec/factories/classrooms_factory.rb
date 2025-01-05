FactoryBot.define do
  factory :classroom do
    number { 1 }
    name { Faker::Restaurant.name }
  end
end
