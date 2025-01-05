module Schedules
  class CreateService
    def initialize(student, section)
      @student = student
      @section = section
    end

    def call
      validate
      create!
    end

    private

    def validate
      validator = Schedules::SectionIntersectionValidator.new(@student, @section)
      return if validator.valid?

      raise(validator.error)
    end

    def create!
      Schedule.create!(student: @student, section: @section)
    end
  end
end
