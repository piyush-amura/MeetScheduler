# Class Mom provides Minutes Of Meetings
# this model has one to one association with Meeting model
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Mom < ApplicationRecord
  belongs_to :meeting
  has_many :agendas

  validates :summary, presence: true
  validates :meeting_id, presence: true
  validate :validate_meeting

  # validation for maintaning one to one relation
  # between Mom and Meeting model
  def validate_meeting
    unless Mom.where(meeting_id: meeting_id).nil?
      errors.add(:meeting_id, 'meeting already belongs to another meeting')
    end
  end
end
