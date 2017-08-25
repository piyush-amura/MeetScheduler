#
# Class Meeting provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class Meeting < ApplicationRecord
  belongs_to :venue
  has_and_belongs_to_many :members, class_name: 'User'
  has_one :mom
  
  def organiser
    User.where(id: organiser_id).first
  end
end
