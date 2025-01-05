FactoryBot.define do
  factory :subject do
    name { Faker::Educator.subject }
    description { "" }
  end
end
