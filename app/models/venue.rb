# Class Venue provides model for venues table
# Venue has one to many association with meetings
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Venue < ApplicationRecord
  has_many :meetings

  # method for checking availability
  # of the venue
  # returns boolean value
  def available?
    status == 'available'
  end
end
