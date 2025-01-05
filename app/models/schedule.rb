class Schedule < ApplicationRecord
  belongs_to :student
  belongs_to :section
  has_one :teacher, through: :section
  has_one :subject, through: :section
  has_one :classroom, through: :section
end
