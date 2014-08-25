class CustomRegistrationsController < Devise::RegistrationsController
  before_action :authenticate_member!

  def update
    @member = Member.find(params[:id])

    # required for settings form to submit when password is left blank
    if params[:custom_registration][:password].blank?
      params[:custom_registration].delete('password')
      params[:custom_registration].delete('password_confirmation')
    end

    respond_to do |format|
      puts params[:custom_registration]
      if @member.update_attributes(member_attributes)
        @member.save

        # sign the member in with their new password so it doesn't redirect to the login screen
        sign_in @member, bypass: true

        format.json { head :no_content }
      else
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def member_attributes
    params.require(:custom_registration).permit(:name, :last_name, :email, :summary)
  end
end
