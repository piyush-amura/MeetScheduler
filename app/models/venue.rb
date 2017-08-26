# Class Venue provides model for venues table
# Venue has one to many association with meetings
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Venue < ApplicationRecord
  TYPES = %w[available not_available].freeze

  has_many :meetings

  validates :name, presence: true
  validates :address, presence: true

  # custom Validation for status
  validate :status_validation, :capacity_validation

  # method for checking status type
  # adds a error to error array
  def status_validation
    errors.add(:status, 'restricted from use.') unless TYPES.include?(status)
  end

  # method for checking non negative value on capacity
  # adds a error to error array
  def capacity_validation
    errors.add(:capacity, 'cannot be negative') if capacity <= 0
  end

  # method for checking availability
  # of the venue
  # returns boolean value
  def available?
    status == 'available'
  end
end
