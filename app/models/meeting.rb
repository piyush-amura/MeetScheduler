#
# Class Meeting provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class Meeting < ApplicationRecord
  belongs_to :venue
  
  def organiser
    User.where(id: organiser_id).first
  end
end
