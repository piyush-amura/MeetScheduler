# Class Suggestion provides rich join for user and agenda
# and has many to one association with User and Agenda model
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Suggestion
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user,   foreign_key: :user_id,   index: true
  belongs_to :agenda, foreign_key: :agenda_id, index: true

  field :suggestion, type: String
     
  validates :user_id, presence: true
  validates :agenda_id, presence: true
  validates :suggestion, presence: true
end
