class Section < ApplicationRecord
  belongs_to :classroom
  belongs_to :subject
  belongs_to :teacher
  has_many :schedules
end
