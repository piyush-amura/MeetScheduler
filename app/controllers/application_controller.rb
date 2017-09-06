# Class ApplicationController provides <description>
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource.is_a?(User::Admin)
    when true  then users_admins_meetings_url
    when false then users_employees_meetings_url
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_pars|
      user_pars.permit(:type, :email, :password, :name, :password_confirmation)
    end
  end
end
