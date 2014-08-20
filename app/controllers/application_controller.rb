class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end


protected
  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name_name, :last_name, :summary, :email, :password, :password_confirmation)
    end
  end
end
