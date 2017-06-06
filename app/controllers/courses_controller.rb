class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors.messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    begin
      if @course.destroy
      else
      end
    rescue => e
      render json: not found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      begin
        @course = Course.find(params[:id])
      rescue ActiveRecord::NotFound => e
        render json: not found
      rescue => e
        render json: general error
      end
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.permit(:name, :tutor_name)
    end
end
