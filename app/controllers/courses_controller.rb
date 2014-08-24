class CoursesController < PrivateController

  before_action :admin_action!, only: [:create, :update, :destroy]
  def index
    respond_to do |format|
      format.json { render status: 200, json: Course.all }
    end
  end

  def show
    @course = Course.find_by(id: params[:id]).to_json(:include => :members)
    respond_to do |format|
      if @course
        format.json { render status: 200, json: @course }
      else
        format.json { render status: 404, json: 'Course not found' }
      end
    end
  end

  def create
    @course = Course.new course_params
    respond_to do |format|
      if @course.save
        format.json { render status: 200, json: @course }
      else
        format.json { render status: 422, json: 'Unacceptable request' }
      end
    end
  end

  private
  def admin_action!
    if not current_member.has_role?('admin')
      respond_to do |format|
        format.json { render status: 422, json: 'Only an admin can perform this action' }
      end
    end
  end

  def course_params
    params.require(:course).permit(:type, :city, :start_date, :end_date)
  end

end
