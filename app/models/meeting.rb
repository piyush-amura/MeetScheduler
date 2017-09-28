# Class Meeting provides model for meetings table
# @author Piyush Wani <piyush.wani@amuratech.com>
class Meeting
  include Mongoid::Document
  include Mongoid::Timestamps

  TYPES = %w[on\ time delayed canceled].freeze

  belongs_to :venue, foreign_key: :venue_id, index: true
  belongs_to :organiser, class_name: 'User', foreign_key: :organiser_id, index: true
  has_and_belongs_to_many :members, class_name: 'User'
  has_one :mom , dependent: :destroy

  field 'date',       type: Date
  field 'start_time', type: Time
  field 'status',     type: String, default: 'on time'
  field 'key_note',   type: String
  field 'duration',   type: Float

  validates :date, presence: true
  validates :start_time, presence: true
  validates :key_note, presence: true
  validates :duration, presence: true
  validates :organiser_id, presence: true
  validates :venue_id, presence: true
  validate  :date_validation

  # validation for checking non negative value on capacity
  validates :duration, numericality: { greater_than: 0 }

  # Validations for checking status type
  validates :status, presence: true,
                     inclusion: { in: TYPES,
                                  message: '%<value>s restricted from use.' }

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
  # date should not be from past
  # adds a error to error array
  def date_validation
    unless date.nil?
      errors.add(:date, ': cannot select past date.') if date < Date.today
    end
  end
end
