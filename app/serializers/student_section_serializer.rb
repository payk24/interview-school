class StudentSectionSerializer < ActiveModel::Serializer
  attributes :id
  has_one :student
  has_one :section
end
