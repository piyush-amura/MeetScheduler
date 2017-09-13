# Class Venue provides model for venues table
# Venue has one to many association with meetings
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Venue < ApplicationRecord
  TYPES = %w[available not\ available].freeze

  has_many :meetings

  validates :name, presence: true
  validates :address, presence: true

  # Validation for status type check
  validates :status, presence: true,
                     inclusion: { in: TYPES,
                                  message: '%<value>s restricted from use.' }

  # validation for checking non negative value on capacity
  validates :capacity, numericality: { greater_than: 0,
                                       only_integer: true }

end
