# Class Meeting provides model for meetings table
# @author Piyush Wani <piyush.wani@amuratech.com>
class Meeting < ApplicationRecord
  TYPES = %w[on\ time delayed canceled].freeze

  belongs_to :venue
  has_and_belongs_to_many :members, class_name: 'User'
  has_one :mom

  validates :date, presence: true
  validates :start_time, presence: true
  validates :key_note, presence: true
  validates :duration, presence: true
  validates :organiser_id, presence: true
  validates :venue_id, presence: true
  validate :status_validation
  validate :date_validation
  validate :duration_validation
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

  # method for checking status type
  # adds a error to error array
  def status_validation
    errors.add(:status, 'restricted from use.') unless TYPES.include?(status)
  end

  # method for checking status type
  # date should not be from past
  # adds a error to error array
  def date_validation
    errors.add(:date, ': cannot select past date.') if date < Date.today
  end

  # method for checking non negative value on capacity
  # adds a error to error array
  def duration_validation
    errors.add(:duration, 'cannot be negative or zero') if duration <= 0
  end
end
