
# Class Agenda provides information about agendas
# of the Meeting.
# @author Piyush Wani <piyush.wani@amuratech.com>
class Agenda < ApplicationRecord
  TYPES = %w[approval\ needed approved not\ approved].freeze
  belongs_to :mom
  has_many :suggestions, -> { select(:suggestion) }

  validates :mom_id, presence: true
  validates :name, presence: true
  validates :allocated_time, presence: true
  validates :action, presence: true
  validates :status, presence: true

  validate :allocated_time_validation
  validate :status_validation

  def allocated_time_validation
    errors.add(:allocated_time, 'cannot be negative') if allocated_time <= 0
  end

  def status_validation
    errors.add(:status, 'restricted from use.') unless TYPES.include?(status)
  end
end
