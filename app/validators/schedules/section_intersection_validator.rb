module Schedules
  class SectionIntersectionValidator
    def initialize(student, section)
      @student = student
      @section = section
    end

    def valid?
      !@student.sections.where(
        "days_of_week && :days_of_week",
        days_of_week: "{#{@section.days_of_week.join(',')}}"
      ).having(
        "max(start_at) <= :start_at AND min(end_at) >= :end_at",
        start_at: @section.end_at, end_at: @section.start_at
      ).group(:id).exists?
    end

    def error
      @section.errors.add(:base, "Invalid section. Section intersection!")

      ActiveRecord::RecordInvalid.new(@section)
    end
  end
end
