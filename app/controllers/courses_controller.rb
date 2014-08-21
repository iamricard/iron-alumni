class CoursesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render status: 200, json: Course.all }
    end
  end

  def create
    @course = Course.new course_params
    respond_to do |format|
      format.json do
        if @course.save
          render status: 200, json: @course
        else
          render status: 422, json: 'Unacceptable request'
        end
      end
    end
  end

  private
  def course_params
    params.require(:course).permit(:type, :city, :start_date, :end_date)
  end
end
