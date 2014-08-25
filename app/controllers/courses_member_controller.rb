class CoursesMemberController < PrivateController
  def update
    @course = Course.find_by(id: params[:course_id])
    @member = Member.find_by(id: params[:id])

    @course.members << @member
    respond_to do |format|
      if @course.save
        format.json { render status: 200, json: @course.to_json(include: :members) }
      else
        format.json { render status: 422, json: 'Unacceptable request' }
      end
    end
  end
end
