# Class User provides model for users table of
# this application
#
# @author Piyush Wani <piyush.wani@amuratech.com>
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # many to many Association
  has_and_belongs_to_many :meetings

  # one to many Association (for rich join) and only suggestion is selected
  has_many :suggestions, -> { select(:suggestion) }

  # method provides list of the meetings
  # organised by user
  # returns list of meetings objects
  def organised_meetings
    Meeting.where(organiser_id: id)
  end

  # method provides list of all past meetings
  # attended by user
  # returns list of meetings objects
  def past_meetings(d = Date.today)
    meetings.where(['date < ?', d])
  end

  # method provides list of all past meetings
  # attended by user
  # returns list of meetings objects
  def upcoming_meetings(d = Date.today)
    meetings.where(['date > ?', d])
  end
end
