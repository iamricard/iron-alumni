class AdminController < PrivateController

  before_action :admin_action!

  def new_course
    @course = Course.new
  end

  def create_course
    @course = Course.new course_params
    if @course.save!
      redirect_to new_members_admin_path(@course.id)
    else
      render 'new_course'
    end
  end

  def new_members
    @members = Hash.new
  end

  def create_members
    course = Course.find_by(id: params[:id])
    email_list = params[:email_list].split(/,\s+/)
    email_list.each do |email|
      member = Member.find_or_create(email, generated_password)
      course.members << member
    end
    render 'new_members'
  end

  private
  def course_params
    params.require(:course).permit(:course_type, :city, :start_date, :end_date)
  end

end
