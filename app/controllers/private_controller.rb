class PrivateController < ApplicationController
  before_action :authenticate_member!

  private

  def admin_action!
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { render status: 422, json: 'Only an admin can perform this action' }
    end unless current_member.role?('admin')
  end
end
