class SectionSerializer < ActiveModel::Serializer
  attributes :id, :start_at, :end_at
  has_one :teacher_subject
  has_one :classroom
end
