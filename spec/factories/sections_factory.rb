FactoryBot.define do
  factory :section do
    classroom
    subject
    teacher
    start_at { Time.new(2000, 1, 1, 10, 0) }
    end_at { Time.new(2000, 1, 1, 10, 50) }
    days_of_week { (Array.new(rand(1..5)) { rand(1..5) }).sort.uniq }
  end
end
