class Section < ApplicationRecord
  belongs_to :teacher_subject
  belongs_to :classroom
  has_many :student_sections
end
