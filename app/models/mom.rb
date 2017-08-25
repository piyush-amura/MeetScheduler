#
# Class Mom provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class Mom < ApplicationRecord
  belongs_to :meeting
  has_many :agendas
end
