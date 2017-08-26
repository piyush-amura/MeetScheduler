# Class Mom provides Minutes Of Meetings
# this model has one to one association with Meeting model
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Mom < ApplicationRecord
  belongs_to :meeting
  has_many :agendas
end
