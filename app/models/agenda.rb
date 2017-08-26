
# Class Agenda provides information about agendas
# of the Meeting.
# @author Piyush Wani <piyush.wani@amuratech.com>
class Agenda < ApplicationRecord
  belongs_to :mom
  has_many :suggestions, -> { select(:suggestion) }
end
