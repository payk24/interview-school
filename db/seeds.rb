# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# creates 30 teachers with random first and last names
30.times do
  Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# creates 30 subjects with random names
30.times do
  Subject.create(name: Faker::Educator.subject)
end

# creates 30 classrooms with numbers from 1 to 30 and random names
30.times do |i|
  Classroom.create(number: i + 1, name: Faker::Restaurant.name)
end

# creates 90 students with random first and last names and random classrooms
90.times do
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# creates 30 sections with random teacher subjects and classrooms
30.times do
  start_time = Faker::Time.forward(days: 1, period: :morning)
  end_time = start_time + rand(90).minute
  Section.create(
    classroom: Classroom.all.sample,
    subject: Subject.all.sample,
    teacher: Teacher.all.sample,
    start_at: start_time,
    end_at: end_time,
    days_of_week: (Array.new(rand(1..5)) { rand(1..5) }).sort.uniq
  )
end

Student.all.each do |student|
  # assigns 3 random sections to each student
  3.times do
    Schedule.create(
      student: student,
      section: Section.where.not(id: Schedule.where(student: student).pluck(:section_id)).sample
    )
  end
end
