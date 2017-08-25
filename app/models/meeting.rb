#
# Class Meeting provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class Meeting < ApplicationRecord
  def organiser
    User.where(id: organiser_id).first
  end
end
