class MembersController < ApplicationController

  def index
    @members = Member.filter(params.slice(:email))
    respond_to do |format|
      format.json { render json: @members }
    end
  end

  def show
    @member = Member.find_by(id: params[:id])
    respond_to do |format|
      format.json { render json: @member }
    end
  end

end
