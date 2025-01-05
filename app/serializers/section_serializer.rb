class SectionSerializer < ActiveModel::Serializer
  attributes :id, :start_at, :end_at, :days_of_week
  has_one :classroom
  has_one :subject
  has_one :teacher
  has_many :schedules
end
