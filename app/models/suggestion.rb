# Class Suggestion provides rich join for user and agenda
# and has many to one association with User and Agenda model
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :agenda

  validates :user_id, presence: true
  validates :agenda_id, presence: true
  validates :suggestion, presence: true
end
