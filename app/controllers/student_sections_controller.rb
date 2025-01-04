class StudentSectionsController < ApplicationController
  before_action :set_student_section, only: %i[ show update destroy ]

  # GET /student_sections
  def index
    @student_sections = StudentSection.all

    render json: @student_sections
  end

  # GET /student_sections/1
  def show
    render json: @student_section
  end

  # POST /student_sections
  def create
    @student_section = StudentSection.new(student_section_params)

    if @student_section.save
      render json: @student_section, status: :created, location: @student_section
    else
      render json: @student_section.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /student_sections/1
  def update
    if @student_section.update(student_section_params)
      render json: @student_section
    else
      render json: @student_section.errors, status: :unprocessable_entity
    end
  end

  # DELETE /student_sections/1
  def destroy
    @student_section.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_section
      @student_section = StudentSection.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def student_section_params
      params.expect(student_section: [ :student_id, :section_id ])
    end
end
