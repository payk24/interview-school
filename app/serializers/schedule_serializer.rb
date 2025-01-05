class ScheduleSerializer < ActiveModel::Serializer
  attributes :id
  has_one :section
  has_one :teacher
  has_one :subject
  has_one :classroom
end
