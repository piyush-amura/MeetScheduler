# Class ApplicationController provides <description>
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
