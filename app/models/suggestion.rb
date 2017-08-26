#
# Class Suggestion provides <description>
#
# @author Joe Blog <Joe.Blog@nowhere.com>
#
class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :agenda
end
