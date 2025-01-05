module V1
  class SchedulesController < ApplicationController
    include ActionController::MimeResponds

    before_action :find_student
    before_action :find_schedule, only: %i[ show destroy ]
    before_action :find_section, only: %i[ create ]

    # GET /schedules
    def index
      render json: schedules
    end

    # GET /schedules/1
    def show
      render json: @schedule
    end

    # POST /schedules
    def create
      @schedule = Schedules::CreateService.new(@student, @section).call

      render json: @schedule, status: :created, location: @schedule
    end

    # DELETE /schedules/1
    def destroy
      Schedules::DestroyService.new(@schedule).call
    end

    def export
      respond_to do |format|
        format.pdf do
          send_data Schedules::ExportService.new(Student.last).call, filename: "Schedules.pdf", type: "application/pdf", disposition: "attachment"
        end
      end
    end

    private

    def find_schedule
      @schedule = schedules.find(params.expect(:id))
    end

    def find_student
      @student = Student.find(params.expect(:student_id))
    end

    def find_section
      @section = Section.find(params.expect(:section_id))
    end

    def schedules
      @student.schedules
    end
  end
end
