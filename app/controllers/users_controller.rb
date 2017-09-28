# Class UsersController provides base controller for Users
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class UsersController < ApllicationController
  before_action :authenticate_user!

  # def new
  # 	byebug
  # end

  # def create
  #   byebug
  # end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_pars|
  #     user_pars.permit(:email, :password, :name, :password_confirmation,:type)
  #   end
  # end

  # before_action :authenticate_user!

  # def create
  #   build_resource(registration_params)
  #   if resource.valid?
  #     sign_up(resource_name, resource)
  #     flash[:notice] = 'User Successfully created!'
  #     redirect_to root_path
  #   else
  #     flash[:notice] = resource.errors.full_messages.join(', ')
  #     render 'new'
  #   end
  # end

  # private

  # def registration_params
  #   params.require(:user).permit(:email, :password, :name, :password_confirmation,:_type)
  # end
end
