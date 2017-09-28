# Class Mom provides Minutes Of Meetings
# this model has one to one association with Meeting model
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Mom
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :meeting,  index: true, foreign_key: 'meeting_id'
  has_many :agendas, dependent: :destroy

  field :summary, type: String
  
  validates :summary, presence: true
  validates :meeting_id, presence: true, uniqueness: {
    message: 'Mom already belongs to another meeting'
  }
end
