# Class UsersController provides base controller for Users
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class UsersController < ApplicationController
  before_action :authenticate_user!
end
