# Class Suggestion provides rich join for user and agenda
# and has many to one association with User and Agenda model
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :agenda
end
