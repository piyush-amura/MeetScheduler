
# Class Agenda provides information about agendas
# of the Meeting.
# @author Piyush Wani <piyush.wani@amuratech.com>
class Agenda < ApplicationRecord
  TYPES = %w[approval\ needed approved not\ approved].freeze
  belongs_to :mom
  has_many :suggestions, -> { select(:suggestion) }
  has_many :suggestions, dependent: :destroy

  validates :mom_id, presence: true
  validates :name, presence: true
  # Validations for allocated_time value
  validates :allocated_time, numericality: { greater_than: 0,
                                             only_integer: true }
  validates :action, presence: true
  # Validations for status
  validates :status, presence: true,
                     inclusion: { in: TYPES,
                                  message: '%<value>s restricted from use.' }
end
