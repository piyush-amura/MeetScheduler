#
# Class User provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :meetings 

  def organised_meetings
    Meeting.where(organiser_id: id)
  end
end
