
# Class Agenda provides information about agendas
# of the Meeting.
# @author Piyush Wani <piyush.wani@amuratech.com>
class Agenda
  include Mongoid::Document
  include Mongoid::Timestamps

  TYPES = %w[approval\ needed approved not\ approved].freeze
  
  belongs_to :mom, foreign_key: :mom_id, index: true
  has_many :suggestions 
  # -> { pluck(:suggestion) }
  has_many :suggestions, dependent: :destroy

  # t.references :mom, index: true, foreign_key: true, null: false
  field 'name',           type: String
  field 'allocated_time', type: Integer, default: 30
  field 'action',         type: String
  field 'status',         type: String, default: 'approval needed'

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
