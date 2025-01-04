class Section < ApplicationRecord
  belongs_to :teacher_subject
  belongs_to :classroom
end
