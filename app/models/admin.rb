# Class Admin inherits properties of User model
# of this application.
# This is a example of single table inheritance
# 
# @author Piyush Wani <piyush.wani@amuratech.com>
class Admin < User
  # method returns list of all scheduled meetings
  def scheduled_meetings
    Meeting.all
  end
end
