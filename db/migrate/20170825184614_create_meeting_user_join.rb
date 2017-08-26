# migration class
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class CreateMeetingUserJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings_users, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :meeting, index: true, foreign_key: true
    end
  end
end
