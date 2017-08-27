# Class User provides model for users table of
# this application
#
# @author Piyush Wani <piyush.wani@amuratech.com>
class User < ApplicationRecord
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  TYPES = %w[Employee Admin].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations for email using REGEX
  validates :email, length: { maximum: 100 },
                    format: EMAIL_REGEX

  # Validations for type
  validates :type, presence: true,
                   inclusion: { in: TYPES,
                                message: '%<value>s restricted from use.' }
  # Validations for name
  validates :name, presence: true
                  
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
