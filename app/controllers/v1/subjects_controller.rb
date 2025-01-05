module V1
  class SubjectsController < ApplicationController
    before_action :set_subject, only: %i[ show update destroy ]

    # GET /subjects
    def index
      @subjects = Subject.all

      render json: @subjects
    end

    # GET /subjects/1
    def show
      render json: @subject
    end

    # POST /subjects
    def create
      @subject = Subject.new(subject_params)

      if @subject.save
        render json: @subject, status: :created, location: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /subjects/1
    def update
      if @subject.update(subject_params)
        render json: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end

    # DELETE /subjects/1
    def destroy
      @subject.destroy!
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.expect(subject: [ :name, :description ])
    end
  end
end
