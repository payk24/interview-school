module Schedules
  class DestroyService
    def initialize(section)
      @section = section
    end

    def call
      @schedule.destroy!
    end
  end
end
