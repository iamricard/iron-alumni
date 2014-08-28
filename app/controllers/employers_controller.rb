class EmployersController < PrivateController

  def index
    respond_to do |format|
      format.json { render json: Employer.all.to_json(include: :members) }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: Employer.find_by(id: params[:id]).to_json(include: { members: { include: :employer }}) }
    end
  end

end
