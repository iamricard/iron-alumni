class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_member!
  before_action :same_member!, only: [:update]

  def update
    @member = Member.find(params[:id])

    # required for settings form to submit when password is left blank
    if params[:registration][:password].blank?
      params[:registration].delete('password')
      params[:registration].delete('password_confirmation')
    end

    if params[:registration][:employer]
      params[:registration][:employer] = Employer.find_or_create_by!(name: params[:registration][:employer])
    end

    respond_to do |format|
      if @member.update_attributes(member_attributes)
        params[:registration][:employer].members << @member

        # sign the member in with their new password so it doesn't redirect to the login screen
        sign_in @member, bypass: true

        format.json { head :no_content }
      else
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def same_member!
    respond_to do |format|
      format.json { render json: 'Not your user', status: :unprocessable_entity }
    end unless current_member.id == params[:id]
  end

  def member_attributes
    params.require(:registration).permit(:name, :last_name, :email, :summary, :employer)
  end
end
