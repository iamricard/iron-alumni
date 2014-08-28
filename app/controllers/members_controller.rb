class MembersController < PrivateController
  def index
    @members = Member.filter(params.slice(:email)).to_json(include: :employer)
    respond_to do |format|
      format.json { render json: @members }
    end
  end

  def show
    @member = Member.find_by(id: params[:id]).to_json(include: :employer)
    respond_to do |format|
      format.json { render json: @member }
    end
  end
end
