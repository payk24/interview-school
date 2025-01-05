class Teacher < ApplicationRecord
  has_many :sections

  def full_name
    "#{first_name} #{last_name}"
  end
end
