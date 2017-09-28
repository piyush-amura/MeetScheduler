# Class Venue provides model for venues table
# Venue has one to many association with meetings
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Venue
  include Mongoid::Document
  include Mongoid::Timestamps

  TYPES = %w[available not\ available].freeze

  has_many :meetings

  field :name,     type: String
  field :address,  type: String
  field :capacity, type: Integer, default: 10
  field :status,   type: String,  default: 'available'
  
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
