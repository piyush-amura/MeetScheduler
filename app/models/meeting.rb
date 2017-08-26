# Class Meeting provides model for meetings table
# @author Piyush Wani <piyush.wani@amuratech.com>
class Meeting < ApplicationRecord
  belongs_to :venue
  has_and_belongs_to_many :members, class_name: 'User'
  has_one :mom

  # getter method for oraniser of the meeting
  # returns object of User class
  def organiser
    User.where(id: organiser_id).first
  end

  # setter method for oraniser of the meeting
  # assigns id of object of User class to organiser_id
  # of the instance
  # returns instance of meeting
  def organiser=(user = nil)
    self.organiser_id = user.id
  end
end
